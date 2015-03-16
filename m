From: sricharan@codeaurora.org
Subject: Re: [Patch v4 2/2] dmaengine: Add ADM driver
Date: Mon, 16 Mar 2015 08:15:26 -0000
Message-ID: <11135b79b94477532e57f30b1ea3c715.squirrel@www.codeaurora.org>
References: <1423719965-8156-1-git-send-email-agross@codeaurora.org>
    <1423719965-8156-3-git-send-email-agross@codeaurora.org>
    <20150313085745.GG32000@intel.com>
    <20150313220627.GB23640@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150313220627.GB23640@qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: Vinod Koul <vinod.koul@intel.com>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>, Kumar Gala <galak@codeaurora.org>, dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hi,

<snip>
>
>>
>> > +static int adm_get_blksize(unsigned int burst)
>> > +{
>> > +	int ret;
>> > +
>> > +	switch (burst) {
>> > +	case 16:
>> > +		ret = 0;
>> > +		break;
>> > +	case 32:
>> > +		ret = 1;
>> > +		break;
>> > +	case 64:
>> > +		ret = 2;
>> > +		break;
>> > +	case 128:
>> > +		ret = 3;
>> > +		break;
>> > +	case 192:
>> > +		ret = 4;
>> > +		break;
>> > +	case 256:
>> > +		ret = 5;
>> > +		break;
>> ffs(burst>>4) ?
>
> that should work nicely.  thanks.
>
  Will not work for 192, 256 ?

Regards,
 Sricharan
