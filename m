From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH 1/4] ARM: shmobile: r8a7778: add Ether DT support
Date: Tue, 03 Sep 2013 17:53:13 +0400
Message-ID: <5225E9C9.2060906@cogentembedded.com>
References: <201309010311.05466.sergei.shtylyov@cogentembedded.com> <1738124.5rApJWhXUN@avalon> <1378135954.3321.5.camel@hornet> <2922765.My7X58lhxd@avalon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <2922765.My7X58lhxd@avalon>
Sender: linux-sh-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pawel Moll <pawel.moll@arm.com>, "horms@verge.net.au" <horms@verge.net.au>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, Mark Rutland <Mark.Rutland@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "ian.campbell@citrix.com" <ian.campbell@citrix.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "magnus.damm@gmail.com" <magnus.damm@gmail.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 03-09-2013 16:11, Laurent Pinchart wrote:

>>> Documentation/devicetree/booting-without-of.txt mentions it, as wel=
l as a
>>> couple of other DT bindings document, but there's no clear document=
ation
>>> of what device_type should be for network device, and whether the p=
roperty
>>> is mandatory or optional. Clarifying the documentation would be gre=
at.

>> It's documented in the ePAPR spec:

>> "The device_type property was used in IEEE 1275 to describe the devi=
ce=E2=80=99s
>> FCode programming model. Because ePAPR does not have FCode, new use =
of
>> the property is deprecated, and it should be included only on cpu an=
d
>> memory nodes for compatibility with IEEE 1275=E2=80=93derived device=
 trees."

> Thank you for the clarification.

>> The bottom line is - don't use it, unless you've good good reasons?

> I'll let Sergei share his opinion on whether we've got good reasons :=
-)

    No, we don't, I'll remove the prop.

WBR, Sergei

