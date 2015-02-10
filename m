Return-Path: <rjui@broadcom.com>
Message-ID: <54D996AC.3000405@broadcom.com>
Date: Mon, 9 Feb 2015 21:27:08 -0800
From: Ray Jui <rjui@broadcom.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] i2c: Support for Netlogic XLP9XX/5XX I2C controller.
References: <1421393020-18807-1-git-send-email-jchandra@broadcom.com> <1421393020-18807-2-git-send-email-jchandra@broadcom.com> <20150209152805.GC8024@katana> <20150209161549.GA2787@jayachandranc.netlogicmicro.com> <20150209172301.GA11749@katana>
In-Reply-To: <20150209172301.GA11749@katana>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>, "Jayachandran C." <jchandra@broadcom.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, "Kumar Gala  <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Subhendu Sekhar Behera" <sbehera@broadcom.com>
List-ID: <devicetree@vger.kernel.org>



On 2/9/2015 9:23 AM, Wolfram Sang wrote:
> 
>> Given that we have already have i2c/busses/i2c-xlr.c upstream (and updates
>> to i2c-ocores.c for our earlier chip), I was hoping that we have got things
>> right this time.
> 
> From the glimpse I had, it was mostly OK. Yet, a number of nits in
> regard to API updates, superfluous things. Stuff like that.
> 
> You could also check earlier reviews from me and check if there are
> issues which apply to your driver as well.
> 
>> Anyway, I will forward it internally to Ray for review, and if necessary
>> submit another patch.
> 
> Thanks!
> 
Yes, I'll help to review it. Thanks!

Ray
