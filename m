From: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6] drm: bridge/dw_hdmi: add dw hdmi i2c bus adapter
 support
Date: Wed, 14 Sep 2016 21:46:22 +0300
Message-ID: <749c8858-9fd2-dcbc-d980-1652c4682e31@mentor.com>
References: <1472017597-11221-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <20160829155006.GA27342@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160829155006.GA27342@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>, Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Philipp,

On 08/29/2016 06:50 PM, Rob Herring wrote:
> On Wed, Aug 24, 2016 at 08:46:37AM +0300, Vladimir Zapolskiy wrote:
>> The change adds support of internal HDMI I2C master controller, this
>> subdevice is used by default, if "ddc-i2c-bus" DT property is omitted.
>>
>> The main purpose of this functionality is to support reading EDID from
>> an HDMI monitor on boards, which don't have an I2C bus connected to
>> DDC pins.
>>
>> The current implementation does not support "I2C Master Interface
>> Extended Read Mode" to read data addressed by non-zero segment
>> pointer, this means that if EDID has more than 1 extension blocks,
>> EDID reading operation won't succeed, in my practice all tested HDMI
>> monitors have at maximum one extension block.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
>> ---
>> The change is based on top of v4.8.0-rc1 and a fix in DW HDMI driver
>> https://patchwork.kernel.org/patch/9284717/
>>
>> Changes from v5 to v6:
>> * rebased on top of v4.8.0-rc1
>> * fixed one improper resource deallocation on error path of dw_hdmi_bind()
>> * added a comment describing a mutex asked by checkpatch.pl --strict
>>
>> Link to version v5: https://patchwork.kernel.org/patch/7279831/
>>
>> Changes from v4 to v5:
>> * do I2C bus controller initialization only once in bind() as it was done
>>   in v1-v3 of the change.
>>
>> Changes from v3 to v4, thanks to Doug and Philipp for review:
>> * set speed mode after software reset in dw_hdmi_i2c_init()
>> * by default set standard speed mode instead of fast speed mode, on iMX6Q
>>   this configures SCL to 100 KHz, which is compliant with HDMI 1.3a spec
>> * do I2C bus controller reinitialization on every data transfer,
>>   this change hopefully solves some observed problems on RK3288 platform
>> * added short functional change description to dw_hdmi.txt
>>
>> v3 of the change was
>>
>>   Tested-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>>
>> Changes from v2 to v3, thanks to Russell:
>> * moved register field value definitions to dw_hdmi.h
>> * made completions uninterruptible to avoid transfer retries if interrupted
>> * use one completion for both read and write transfers as in v1,
>>   operation_reg is removed
>> * redundant i2c->stat = 0 is removed from dw_hdmi_i2c_read/write()
>> * struct i2c_algorithm dw_hdmi_algorithm is qualified as const
>> * dw_hdmi_i2c_adapter() does not modify struct dw_hdmi on error path
>> * dw_hdmi_i2c_irq() does not modify hdmi->i2c->stat, if interrupt is
>>   not for I2CM
>> * spin lock is removed from dw_hdmi_i2c_irq()
>> * removed spin lock from dw_hdmi_i2c_xfer() around write to
>>   HDMI_IH_MUTE_I2CM_STAT0 register
>> * split loop over message array in dw_hdmi_i2c_xfer() to validation
>>   and transfer parts
>> * added a mutex to serialize I2C transfer requests, i2c->lock is
>>   completely removed
>> * removed if(len) check from dw_hdmi_i2c_write(), hardware supports
>>   only len>0 transfers
>> * described extension blocks <= 1 limitation in the commit message
>> * a number of minor clean ups
>>
>> Changes from v1 to v2:
>> * fixed a devm_kfree() signature
>> * split completions for read and write operations
>>
>>  .../devicetree/bindings/display/bridge/dw_hdmi.txt |   4 +-
>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>
>>  drivers/gpu/drm/bridge/dw-hdmi.c                   | 265 ++++++++++++++++++++-
>>  drivers/gpu/drm/bridge/dw-hdmi.h                   |  19 ++
>>  3 files changed, 281 insertions(+), 7 deletions(-)

as far as I know David accepts pull requests from you, can you please
create and send a pull request for v4.9 containing these changes?

    https://patchwork.kernel.org/patch/9284717/ -- with Russell's ack
    https://patchwork.kernel.org/patch/9296883/ -- with Rob's ack and yours tested-by

Some users anticipate this change, for example see https://lkml.org/lkml/2016/9/14/55

--
With best wishes,
Vladimir
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
