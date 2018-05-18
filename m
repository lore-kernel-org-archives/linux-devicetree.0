Return-Path: <SRS0=tES/=IF=gmail.com=rmfrfs@kernel.org>
References: <20180509143159.20690-1-rui.silva@linaro.org> <20180509143159.20690-2-rui.silva@linaro.org> <20180518141830.GA14547@rob-hp-laptop>
From: Rui Miguel Silva <rmfrfs@gmail.com>
Subject: Re: [PATCH v6 1/2] media: ov2680: dt: Add bindings for OV2680
In-reply-to: <20180518141830.GA14547@rob-hp-laptop>
Date: Fri, 18 May 2018 16:27:21 +0100
Message-ID: <m3in7lrnl2.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
To: Rob Herring <robh@kernel.org>
Cc: Rui Miguel Silva <rui.silva@linaro.org>, mchehab@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, linux-media@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>, Ryan Harkin <ryan.harkin@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Rob,
On Fri 18 May 2018 at 14:18, Rob Herring wrote:
> On Wed, May 09, 2018 at 03:31:58PM +0100, Rui Miguel Silva 
> wrote:
>> Add device tree binding documentation for the OV2680 camera 
>> sensor.
>> 
>> CC: devicetree@vger.kernel.org
>> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
>> ---
>>  .../devicetree/bindings/media/i2c/ov2680.txt  | 46 
>>  +++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>  create mode 100644 
>>  Documentation/devicetree/bindings/media/i2c/ov2680.txt
>
> Please add acks/reviewed bys on new versions.

I have add this to the cover letter [0]:
- Removed Rob Herring Reviewed-by tag, since bindings have changed 
  since his
  ack.

But only now I notice that I did not CC the devicetree list for 
the all
series, but only for this particular patch. Sorry about that.

---
Cheers,
	Rui

[0]: https://www.spinics.net/lists/linux-media/msg133942.html
