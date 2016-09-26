From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
Subject: Re: [PATCH v5 2/2] usb: chipidea: imx: Add binding to disable USB
 60Mhz clock
Date: Mon, 26 Sep 2016 10:54:52 +0200
Message-ID: <bc80fe0a-8a9f-a597-8f8b-e7875302b337@collabora.co.uk>
References: <1474448827-8354-1-git-send-email-fabien.lahoudere@collabora.co.uk>
 <1474448827-8354-3-git-send-email-fabien.lahoudere@collabora.co.uk>
 <20160926081841.7jmvdto2ht23rdw6@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160926081841.7jmvdto2ht23rdw6@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Peter.Chen@nxp.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

On 26/09/16 10:18, Sascha Hauer wrote:
> On Wed, Sep 21, 2016 at 11:07:07AM +0200, Fabien Lahoudere wrote:
>> This binding allow to disable the internal 60Mhz clock for USB host2 or
>> host3.
>>
>> Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
>> ---
>>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt |  1 +
>>  drivers/usb/chipidea/ci_hdrc_imx.c                     |  2 ++
>>  drivers/usb/chipidea/ci_hdrc_imx.h                     |  1 +
>>  drivers/usb/chipidea/usbmisc_imx.c                     | 13 +++++++++++++
>>  4 files changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> index 0e03344..f83da66 100644
>> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.txt
>> @@ -84,6 +84,7 @@ i.mx specific properties
>>  - over-current-active-high: over current signal polarity is high active,
>>    typically over current signal polarity is low active.
>>  - external-vbus-divider: enables off-chip resistor divider for Vbus
>> +- disable-int60ck: disable internal 60MHz clock for usb host2 or host3 on imx53
>
> Why do we need a binding for this? I would assume the driver should know
> whether this clock is in use or not. If it doesn't that's a problem we
> should solve.
>

Yes you are right because we can disable this clock for OTG and with 
ULPI PHY. I think that it will be better to have a dt binding but if it 
is useless I can remove it and disable clock when ULPI mode is enabled.

> Sascha
>

Fabien
