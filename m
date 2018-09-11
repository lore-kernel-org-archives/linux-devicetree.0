From: pheragu@codeaurora.org
Subject: Re: [PATCH v2 2/2] Embedded USB Debugger (EUD) driver
Date: Tue, 11 Sep 2018 13:40:19 -0700
Message-ID: <aade97184ee5027ac6e32fd742cfbc5a@codeaurora.org>
References: <1536096853-30473-1-git-send-email-pheragu@codeaurora.org>
 <1536096853-30473-3-git-send-email-pheragu@codeaurora.org>
 <c68c466a-576f-43d9-a7dd-7ee8e0ebba3f@codeaurora.org>
 <20180905111800.GA30003@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180905111800.GA30003@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Manu Gautam <mgautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, ckadabi@codeaurora.org, tsoni@codeaurora.org, rnayak@codeaurora.org, bryanh@codeaurora.org, psodagud@codeaurora.org, Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 2018-09-05 04:18, Greg KH wrote:
> On Wed, Sep 05, 2018 at 03:01:26PM +0530, Manu Gautam wrote:
>> Hi,
>> 
>> 
>> On 9/5/2018 3:04 AM, Prakruthi Deepak Heragu wrote:
>> > Add support for control peripheral of EUD (Embedded USB Debugger) to
>> > listen to events such as USB attach/detach, charger enable/disable, pet
>> > EUD to indicate software is functional.
>> >
>> > Signed-off-by: Satya Durga Srinivasu Prabhala <satyap@codeaurora.org>
>> > Signed-off-by: Prakruthi Deepak Heragu <pheragu@codeaurora.org>
>> > ---
>> >  drivers/soc/qcom/Kconfig  |  12 ++
>> >  drivers/soc/qcom/Makefile |   1 +
>> >  drivers/soc/qcom/eud.c    | 338 ++++++++++++++++++++++++++++++++++++++++++++++
>> >  3 files changed, 351 insertions(+)
>> >  create mode 100644 drivers/soc/qcom/eud.c
>> >
>> > diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> [snip]
>> > +
>> > +#define EUD_ENABLE_CMD 1
>> > +#define EUD_DISABLE_CMD 0
>> 
>> Why not use module param as boolean? I mean zero to disable and 
>> non-zero to enable?
> 
> Never use module parameters on new code, as it's really hard to ever
> change them.  It also doesn't work for multiple devices of the same
> type.
> 
If not for module_param, do you suggest we use sysfs? module_param also 
provides a
facility to control these parameters through command line too. If we 
can't use
module_param, do you expect us to use __setup(..) API?

> thanks,
> 
> greg k-h

Regards,
Prakruthi Deepak Heragu
