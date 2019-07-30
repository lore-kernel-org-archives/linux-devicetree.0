From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH 1/2] soc: qcom: Extend AOSS QMP driver to support
 resources that are used to wake up the SoC.
Date: Tue, 30 Jul 2019 11:27:51 -0400
Message-ID: <5D4061F7.8020209@linaro.org>
References: <1564418001-24940-1-git-send-email-thara.gopinath@linaro.org>
 <1564418001-24940-2-git-send-email-thara.gopinath@linaro.org>
 <CAHLCerO_5CUmdfdyogc0GwKPtPU4xYLU-FqzB8a8y07mnipTuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHLCerO_5CUmdfdyogc0GwKPtPU4xYLU-FqzB8a8y07mnipTuw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Amit Kucheria <amit.kucheria@linaro.org>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Amit,
Thanks for the review.

On 07/30/2019 08:43 AM, Amit Kucheria wrote:
> On Mon, Jul 29, 2019 at 10:03 PM Thara Gopinath
> <thara.gopinath@linaro.org> wrote:
>>
>> The AOSS QMP driver is extended to communicate with the additional
>> resources. These resources are then registered as cooling devices
>> with the thermal framework.
>>
>> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
>> ---
>>  drivers/soc/qcom/qcom_aoss.c | 129 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 129 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
>> index 5f88519..010877e 100644
>> --- a/drivers/soc/qcom/qcom_aoss.c
>> +++ b/drivers/soc/qcom/qcom_aoss.c
>> @@ -10,6 +10,8 @@
>>  #include <linux/module.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/pm_domain.h>
>> +#include <linux/thermal.h>
>> +#include <linux/slab.h>
>>
>>  #define QMP_DESC_MAGIC                 0x0
>>  #define QMP_DESC_VERSION               0x4
>> @@ -40,6 +42,16 @@
>>  /* 64 bytes is enough to store the requests and provides padding to 4 bytes */
>>  #define QMP_MSG_LEN                    64
>>
>> +#define QMP_NUM_COOLING_RESOURCES      2
>> +
>> +static bool qmp_cdev_init_state = 1;
>> +
>> +struct qmp_cooling_device {
>> +       struct thermal_cooling_device *cdev;
>> +       struct qmp *qmp;
>> +       bool state;
>> +};
>> +
>>  /**
>>   * struct qmp - driver state for QMP implementation
>>   * @msgram: iomem referencing the message RAM used for communication
>> @@ -69,6 +81,7 @@ struct qmp {
>>
>>         struct clk_hw qdss_clk;
>>         struct genpd_onecell_data pd_data;
>> +       struct qmp_cooling_device *cooling_devs;
>>  };
>>
>>  struct qmp_pd {
>> @@ -385,6 +398,117 @@ static void qmp_pd_remove(struct qmp *qmp)
>>                 pm_genpd_remove(data->domains[i]);
>>  }
>>
>> +static int qmp_cdev_get_max_state(struct thermal_cooling_device *cdev,
>> +                                 unsigned long *state)
>> +{
>> +       *state = qmp_cdev_init_state;
>> +       return 0;
>> +}
>> +
>> +static int qmp_cdev_get_cur_state(struct thermal_cooling_device *cdev,
>> +                                 unsigned long *state)
>> +{
>> +       struct qmp_cooling_device *qmp_cdev = cdev->devdata;
>> +
>> +       *state = qmp_cdev->state;
>> +       return 0;
>> +}
>> +
>> +static int qmp_cdev_set_cur_state(struct thermal_cooling_device *cdev,
>> +                                 unsigned long state)
>> +{
>> +       struct qmp_cooling_device *qmp_cdev = cdev->devdata;
>> +       char buf[QMP_MSG_LEN] = {};
>> +       bool cdev_state;
>> +       int ret;
>> +
>> +       /* Normalize state */
>> +       cdev_state = !!state;
>> +
>> +       if (qmp_cdev->state == state)
>> +               return 0;
>> +
>> +       snprintf(buf, sizeof(buf),
>> +                "{class: volt_flr, event:zero_temp, res:%s, value:%s}",
>> +                       qmp_cdev->name,
> 
> This won't compile, there is no member "name" in qmp_cooling_device.

Yes! Sorry about that. I must have send  this from the wrong folder. I
have fixed this and send out another version. Also taken care of the
other comment below.

Regards
Thara
> 
>> +                       cdev_state ? "off" : "on");
>> +
>> +       ret = qmp_send(qmp_cdev->qmp, buf, sizeof(buf));
>> +
>> +       if (!ret)
>> +               qmp_cdev->state = cdev_state;
>> +
>> +       return ret;
>> +}
>> +
>> +static struct thermal_cooling_device_ops qmp_cooling_device_ops = {
>> +       .get_max_state = qmp_cdev_get_max_state,
>> +       .get_cur_state = qmp_cdev_get_cur_state,
>> +       .set_cur_state = qmp_cdev_set_cur_state,
>> +};
>> +
>> +static int qmp_cooling_device_add(struct qmp *qmp,
>> +                                 struct qmp_cooling_device *qmp_cdev,
>> +                                 struct device_node *node)
>> +{
>> +       char *cdev_name = (char *)node->name;
>> +
>> +       qmp_cdev->qmp = qmp;
>> +       qmp_cdev->state = qmp_cdev_init_state;
>> +       qmp_cdev->cdev = devm_thermal_of_cooling_device_register
>> +                               (qmp->dev, node,
>> +                               cdev_name,
>> +                               qmp_cdev, &qmp_cooling_device_ops);
>> +
>> +       if (IS_ERR(qmp_cdev->cdev))
>> +               dev_err(qmp->dev, "unable to register %s cooling device\n",
>> +                       cdev_name);
>> +
>> +       return PTR_ERR_OR_ZERO(qmp_cdev->cdev);
>> +}
>> +
>> +static int qmp_cooling_devices_register(struct qmp *qmp)
>> +{
>> +       struct device_node *np, *child;
>> +       int count = QMP_NUM_COOLING_RESOURCES;
>> +       int ret;
>> +
>> +       np = qmp->dev->of_node;
>> +
>> +       qmp->cooling_devs = devm_kcalloc(qmp->dev, count,
>> +                                        sizeof(*qmp->cooling_devs),
>> +                                        GFP_KERNEL);
>> +
>> +       if (!qmp->cooling_devs)
>> +               return -ENOMEM;
>> +
>> +       for_each_available_child_of_node(np, child) {
>> +               if (!of_find_property(child, "#cooling-cells", NULL))
>> +                       continue;
>> +               ret = qmp_cooling_device_add(qmp, &qmp->cooling_devs[count++],
>> +                                            child);
>> +               if (ret)
>> +                       goto uroll_cooling_devices;
> 
> unroll?
> 
>> +       }
>> +
>> +       return 0;
>> +
>> +uroll_cooling_devices:
>> +       while (--count >= 0)
>> +               thermal_cooling_device_unregister
>> +                       (qmp->cooling_devs[count].cdev);
>> +
>> +       return ret;
>> +}
>> +
>> +static void qmp_cooling_devices_remove(struct qmp *qmp)
>> +{
>> +       int i;
>> +
>> +       for (i = 0; i < QMP_NUM_COOLING_RESOURCES; i++)
>> +               thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
>> +}
>> +
>>  static int qmp_probe(struct platform_device *pdev)
>>  {
>>         struct resource *res;
>> @@ -433,6 +557,10 @@ static int qmp_probe(struct platform_device *pdev)
>>         if (ret)
>>                 goto err_remove_qdss_clk;
>>
>> +       ret = qmp_cooling_devices_register(qmp);
>> +       if (ret)
>> +               dev_err(&pdev->dev, "failed to register aoss cooling devices\n");
>> +
>>         platform_set_drvdata(pdev, qmp);
>>
>>         return 0;
>> @@ -453,6 +581,7 @@ static int qmp_remove(struct platform_device *pdev)
>>
>>         qmp_qdss_clk_remove(qmp);
>>         qmp_pd_remove(qmp);
>> +       qmp_cooling_devices_remove(qmp);
>>
>>         qmp_close(qmp);
>>         mbox_free_channel(qmp->mbox_chan);
>> --
>> 2.1.4
>>
