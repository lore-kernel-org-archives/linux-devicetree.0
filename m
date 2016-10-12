From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC V2 PATCH 10/12] arm64: dts: msm8994 issolate non standard
 bootloader/LK entries
Date: Wed, 12 Oct 2016 07:11:45 -0500
Message-ID: <CAL_JsqL5sN-3_PcSRzOQe+3KAhP01TsAtypuF-c+kpBOA0_ayQ@mail.gmail.com>
References: <1475375919-618-1-git-send-email-jmcnicol@redhat.com>
 <1475375919-618-11-git-send-email-jmcnicol@redhat.com> <CAL_Jsq+ew7p6OYPzdTDmB9LAoGOOKasioYzmU=R+jLza2hWQFw@mail.gmail.com>
 <2149904.D2eaQZN3bA@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <2149904.D2eaQZN3bA@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jeremy McNicoll <jmcnicol@redhat.com>, Andy Gross <andy.gross@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, git@kchr.de, jeremymc@redhat.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-soc@vger.kernel.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 12, 2016 at 5:39 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday, October 11, 2016 7:41:22 PM CEST Rob Herring wrote:
>> On Sat, Oct 1, 2016 at 9:38 PM, Jeremy McNicoll <jmcnicol@redhat.com> wrote:
>> > These non standard DT entries need to be cast aside as to not
>> > pollute the main device tree bindings.  Without these essential
>> > DT items the bootloader/LK will not pass control over to the kernel
>> > and thus never boot.
>>
>> I discussed this with Stephen recently. I'm okay with leaving these on
>> boards that have no chance of getting updated bootloaders to use the
>> compatible string instead. Having to use dtbTool is far worse than a
>> couple of extra properties IMO. I reserve the right to complain if new
>> stuff continues to use these though.
>>
>> > Signed-off-by: Jeremy McNicoll <jeremymc@redhat.com>
>> > ---
>> >  .../arm64/boot/dts/qcom/msm8994-angler-rev-101.dts |  1 -
>> >  arch/arm64/boot/dts/qcom/msm8994.dtsi              |  3 +--
>> >  .../boot/dts/qcom/nexus6p_bootloader_bits.dtsi     | 24 ++++++++++++++++++++++
>>
>> Just put this into the board file rather than yet another include.
>
> The suggestion that I had was to have two .dts files: the normal
> one without these properties, and another .dts file including the
> first but adding these three for compatibility with the legacy
> bootloaders.
>
> That way we could have a 'clean' .dtb file once the bootloaders
> get fixed, and can name the other one appropriately to discourage
> copying the method for new machines.

Yes, that makes sense. Though my understanding is things like the
Nexus 6P and 5X will never get fixed bootloaders. The DB410c and other
dev boards are hopefully another story.

Rob
