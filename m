From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH V2 1/3] dma: add Qualcomm Technologies HIDMA management driver
Date: Thu, 5 Nov 2015 08:31:13 -0600
Message-ID: <CAL_JsqLFjUx2KK1nx=c0b30VWcdgQLGsZy0Ps927AMBMJ-vZaA@mail.gmail.com>
References: <1446444460-21600-1-git-send-email-okaya@codeaurora.org>
 <1446444460-21600-2-git-send-email-okaya@codeaurora.org> <CAL_Jsq+XCkaPD_Bop_BaTfEVP2YuOQ+=ChFvyLN47jps2NcZSA@mail.gmail.com>
 <56378D38.9050509@codeaurora.org> <56379CD6.5020807@codeaurora.org>
 <CAL_JsqJYOe+uE1VE_ojSq=Hx=2roW1CAiB2Hyow0tKUR85cV0Q@mail.gmail.com>
 <5637A1EB.9080002@codeaurora.org> <CAL_JsqLeDEUk6fQN4J20jL5Yma12ucNb0V7PxbQqUC6jJUH3oQ@mail.gmail.com>
 <5637ABD1.5060707@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5637ABD1.5060707@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Timur Tabi <timur@codeaurora.org>
Cc: Sinan Kaya <okaya@codeaurora.org>, dmaengine@vger.kernel.org, Christopher Covington <cov@codeaurora.org>, "jcm@redhat.com" <jcm@redhat.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Nov 2, 2015 at 12:30 PM, Timur Tabi <timur@codeaurora.org> wrote:
> On 11/02/2015 12:25 PM, Rob Herring wrote:
>>
>> Then document it with "<chip>" and fill that in later. Just don't make
>> up version numbers.
>
>
> I don't think you understand.  We literally have no name for our chip. The
> closest is what I used on the pin control driver, "qdf2xxx", which really
> doesn't say anything.
>
>         "qcom,qdf2xxx-hidma-mgmt"

I'm saying document it as "qcom,<chip>-hidma-mgmt" and when you have
the part number update the binding. Meanwhile push on the powers that
be to decide on a part number.

Rob
