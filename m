From: Rob Clark <robdclark@gmail.com>
Subject: Re: [RFCv2] drm/msm: DT support for 8960/8064
Date: Thu, 17 Jul 2014 11:29:33 -0400
Message-ID: <CAF6AEGvCiw5d4b68K7kGLY2YrLUEu9ggySZ0Q8HgHGzSW5qX8w@mail.gmail.com>
References: <1404241055-3579-1-git-send-email-robdclark@gmail.com>
 <1404835244-3735-1-git-send-email-robdclark@gmail.com>
 <CADsdr6O75H33KV7D9fvDEpPfQ6FZ2bH-P84Zf=bjEVuNGbJn9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CADsdr6O75H33KV7D9fvDEpPfQ6FZ2bH-P84Zf=bjEVuNGbJn9A@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: divya ojha <odivya77@gmail.com>
Cc: linux-arm-msm <linux-arm-msm@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu, Jul 17, 2014 at 4:10 AM, divya ojha <odivya77@gmail.com> wrote:
> Hi Rob,
>
> On Tue, Jul 8, 2014 at 9:30 PM, Rob Clark <robdclark@gmail.com> wrote:
>> Now that we (almost) have enough dependencies in place (MMCC, RPM, etc),
>> add necessary DT support so that we can use drm/msm on upstream kernel.
>>
>> Signed-off-by: Rob Clark <robdclark@gmail.com>
>> ---
>> I thought I sent this already, but looks like I've forgot.
> ..
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> index 7f7aade..041c2fc 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
>> @@ -123,7 +123,8 @@ struct hdmi *hdmi_init(struct drm_device *dev, struct drm_encoder *encoder)
>>         for (i = 0; i < config->hpd_reg_cnt; i++) {
>>                 struct regulator *reg;
>>
>> -               reg = devm_regulator_get(&pdev->dev, config->hpd_reg_names[i]);
>> +               reg = devm_regulator_get_exclusive(&pdev->dev,
>> +                               config->hpd_reg_names[i]);
>>                 if (IS_ERR(reg)) {
>>                         ret = PTR_ERR(reg);
>>                         dev_err(dev->dev, "failed to get hpd regulator: %s (%d)\n",
>> @@ -138,7 +139,8 @@ struct hdmi *hdmi_init(struct drm_device *dev, struct drm_encoder *encoder)
>>         for (i = 0; i < config->pwr_reg_cnt; i++) {
>>                 struct regulator *reg;
>>
>> -               reg = devm_regulator_get(&pdev->dev, config->pwr_reg_names[i]);
>> +               reg = devm_regulator_get_exclusive(&pdev->dev,
>> +                               config->pwr_reg_names[i]);
>>                 if (IS_ERR(reg)) {
>>                         ret = PTR_ERR(reg);
>>                         dev_err(dev->dev, "failed to get pwr regulator: %s (%d)\n",
>
> Don't we need to have a if(regulator_enabled) check after
> devm_regulator_get function ?
> I see a similar test after camera regulator_get function call.

tbh, I'm not 100% sure.

Normally I would say that any driver using some resource (regulator,
etc) should take it's own reference irrespective of whether some other
driver already has the regulator/etc, enabled.  Otherwise the
reference counting doesn't work out.

The thing I'm not 100% sure about is interaction w/ bootloader, in
cases where bootloader does initial modeset.  I've had some problems
in this area in the past when I was trying to get DSI working on my
nexus4.  I doubt the correct solution is for the driver to check if
regulator is already enabled by bootloader before enabling it, but I'm
not sure if something else somewhere needs to drop references to
resources enabled by bootloader.

BR,
-R

> -Regards
> Divya
