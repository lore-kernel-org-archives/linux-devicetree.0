From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [RFC PATCH 4/6] dt-bindings: update mvneta binding document
Date: Fri, 7 Dec 2018 17:30:52 +0530
Message-ID: <0dc0916f-2654-53fe-226d-f75c9498bb39@ti.com>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
 <E1gMBMs-00089t-Fd@rmk-PC.armlinux.org.uk> <20181203235455.GA5851@bogus>
 <20181205110009.GQ30658@n2100.armlinux.org.uk>
 <CAL_JsqJXMDqQVQJoq0sXn0VEA1iFpcsK+Hjsxwt-7aWNreAkPw@mail.gmail.com>
 <2b832258-0b8f-a8f9-2907-878d0e4d6ee7@ti.com>
 <20181207104142.GY30658@n2100.armlinux.org.uk>
 <2ac6488c-a060-6875-bc92-c14fe2dbf8af@ti.com>
 <20181207113301.GZ30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207113301.GZ30658@n2100.armlinux.org.uk>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, netdev <netdev@vger.kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "moderated
 list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

On 07/12/18 5:03 PM, Russell King - ARM Linux wrote:
> On Fri, Dec 07, 2018 at 04:43:27PM +0530, Kishon Vijay Abraham I wrote:
>> Russell,
>>
>> No, I haven't merged patches from this series. That would have failed
>> compilation since Grygorii modified enum phy_mode which is used in this series.
>> You have also noted this in your cover letter.
> 
> Ok, but in any case, given the complexities of modifying the patch
> and properly testing it, I think I'll wait until those changes have
> hit mainline before re-spinning this series.  Alternatively, if
> you're happy to take just build-tested version, I could re-spin
> with that so at least we can get the phy bits queued for the merge
> window.

I'd prefer we test it before merging.
> 
> In any case, I'm busy trying to get to the bottom of several OMAP4
> bugs while ill, so this isn't something I want to do at the moment.

Take care!

Thanks
Kishon
> 
