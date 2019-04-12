From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH V5 3/3] hwmon: pwm-fan: Add RPM support via external
 interrupt
Date: Fri, 12 Apr 2019 12:50:35 +0100
Message-ID: <77c56129-d3e7-1518-9d1d-a15a20540269@arm.com>
References: <1554989411-23666-1-git-send-email-stefan.wahren@i2se.com>
 <1554989411-23666-4-git-send-email-stefan.wahren@i2se.com>
 <20190411165742.GA29395@roeck-us.net>
 <019733e8-6b12-f5c1-e251-fd7eabe2891b@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <019733e8-6b12-f5c1-e251-fd7eabe2891b@i2se.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 12/04/2019 12:07, Stefan Wahren wrote:
> On 11.04.19 18:57, Guenter Roeck wrote:
>> On Thu, Apr 11, 2019 at 03:30:11PM +0200, Stefan Wahren wrote:
>>>   
>>> -ATTRIBUTE_GROUPS(pwm_fan);
>>> +static umode_t pwm_fan_attrs_visible(struct kobject *kobj, struct attribute *a,
>>> +				     int n)
>>> +{
>>> +	struct device *dev = container_of(kobj, struct device, kobj);
>>> +	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
>>> +	struct device_attribute *devattr;
>>> +
>>> +	/* Hide fan_input in case no interrupt is available  */
>>> +	devattr = container_of(a, struct device_attribute, attr);
>> Field day for static analyzers - devattr is no longer used.
>> No need to resend. I'll let the series rest for a couple of days
>> and then apply to hwmon-next (after removing devattr) unless there are
>> additional comments.
>>
> Thank you

FWIW you can have a

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

for the whole series. The only minor comment that springs to mind
isn't actually specific to this patch, so is probably best made as
the follow-up below.

Robin.

----->8-----
From: Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] hwmon: pwm-fan: Report probe errors consistently

Printing the error code for a failure provides a head-start for
debugging, since it's often sufficient to pinpoint the origin of the
failure. We already do this for some probe-failure messages, so let's
make the rest of them consistent.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/hwmon/pwm-fan.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 8c4c5eefd4ca..556db4bef743 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -330,7 +330,7 @@ static int pwm_fan_probe(struct platform_device *pdev)

 	ret = pwm_apply_state(ctx->pwm, &state);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to configure PWM\n");
+		dev_err(&pdev->dev, "Failed to configure PWM: %d\n", ret);
 		goto err_reg_disable;
 	}

@@ -348,7 +348,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		ret = devm_request_irq(&pdev->dev, ctx->irq, pulse_handler, 0,
 				       pdev->name, ctx);
 		if (ret) {
-			dev_err(&pdev->dev, "Can't get interrupt working.\n");
+			dev_err(&pdev->dev,
+				"Failed to request interrupt: %d\n", ret);
 			goto err_pwm_disable;
 		}
 		ctx->sample_start = ktime_get();
@@ -358,8 +359,9 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	hwmon = devm_hwmon_device_register_with_groups(&pdev->dev, "pwmfan",
 						       ctx, pwm_fan_groups);
 	if (IS_ERR(hwmon)) {
-		dev_err(&pdev->dev, "Failed to register hwmon device\n");
 		ret = PTR_ERR(hwmon);
+		dev_err(&pdev->dev,
+			"Failed to register hwmon device: %d\n", ret);
 		goto err_del_timer;
 	}

@@ -373,9 +375,10 @@ static int pwm_fan_probe(struct platform_device *pdev)
 							  "pwm-fan", ctx,
 							  &pwm_fan_cooling_ops);
 		if (IS_ERR(cdev)) {
-			dev_err(&pdev->dev,
-				"Failed to register pwm-fan as cooling device");
 			ret = PTR_ERR(cdev);
+			dev_err(&pdev->dev,
+				"Failed to register pwm-fan as cooling device: %d\n",
+				ret);
 			goto err_del_timer;
 		}
 		ctx->cdev = cdev;
