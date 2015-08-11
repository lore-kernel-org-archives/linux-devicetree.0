From: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v1 7/7] ARM: dts: ifc6410: add inforce LVDS panel support
Date: Mon, 10 Aug 2015 20:40:52 -0400
Message-ID: <CAF6AEGumORyT=NimGHFT8jyN4fQ1=xeo31tnvm5X3VndM-J5LA@mail.gmail.com>
References: <1438087956-17307-1-git-send-email-srinivas.kandagatla@linaro.org>
	<1438088076-17606-1-git-send-email-srinivas.kandagatla@linaro.org>
	<20150810232552.GB13472@usrtlx11787.corpusers.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20150810232552.GB13472@usrtlx11787.corpusers.net>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andy Gross <agross@codeaurora.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 10, 2015 at 7:25 PM, Bjorn Andersson
<bjorn.andersson@sonymobile.com> wrote:
> On Tue 28 Jul 05:54 PDT 2015, Srinivas Kandagatla wrote:
>
>> This patch adds LVDS panel for IFC6410.
>>
>
> My ifc6410 doesn't have a LVDS display, so I don't think these nodes
> belong in this dts file.

fwiw, my hope was that we could implement a panel-picker for lvds+ddc,
in a similar way to handling devices that could have multiple
different dsi panels, to make this a bit more automagically
plug-and-play.. srini has done some experiments with probing panel's
edid, so we just need to figure out if vendor+device-id in edid is
reliable enough to have a global table mapping them back to panel
compat strings or whether that table needs to go in dt..

BR,
-R

> I was thinking we could have a variant including this dts file adding
> the panel, but I assume that you can mount other panels than the auo
> panel defined below?
>
>
> Either way, I think we should keep this file to define the stuff that's
> on the IFC6410 itself and then figure out how to aid people in adding
> the rest of their additions...
>
> Regards,
> Bjorn
