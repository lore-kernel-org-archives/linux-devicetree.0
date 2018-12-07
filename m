From: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [RFC PATCH 4/6] dt-bindings: update mvneta binding document
Date: Fri, 7 Dec 2018 16:43:27 +0530
Message-ID: <2ac6488c-a060-6875-bc92-c14fe2dbf8af@ti.com>
References: <20181112122933.GD30658@n2100.armlinux.org.uk>
 <E1gMBMs-00089t-Fd@rmk-PC.armlinux.org.uk> <20181203235455.GA5851@bogus>
 <20181205110009.GQ30658@n2100.armlinux.org.uk>
 <CAL_JsqJXMDqQVQJoq0sXn0VEA1iFpcsK+Hjsxwt-7aWNreAkPw@mail.gmail.com>
 <2b832258-0b8f-a8f9-2907-878d0e4d6ee7@ti.com>
 <20181207104142.GY30658@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181207104142.GY30658@n2100.armlinux.org.uk>
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

Russell,

On 07/12/18 4:11 PM, Russell King - ARM Linux wrote:
> On Fri, Dec 07, 2018 at 09:37:54AM +0530, Kishon Vijay Abraham I wrote:
>> Hi Russell,
>>
>> On 05/12/18 9:00 PM, Rob Herring wrote:
>>> On Wed, Dec 5, 2018 at 5:00 AM Russell King - ARM Linux
>>> <linux@armlinux.org.uk> wrote:
>>>>
>>>> On Mon, Dec 03, 2018 at 05:54:55PM -0600, Rob Herring wrote:
>>>>> On Mon, Nov 12, 2018 at 12:31:02PM +0000, Russell King wrote:
>>>>>> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
>>>>>
>>>>> Needs a better subject and a commit msg.
>>>>
>>>> Hmm, not sure why it didn't contain:
>>>>
>>>> "dt-bindings: net: mvneta: add phys property
>>>>
>>>> Add an optional phys property to the mvneta binding documentation for
>>>> the common phy.
>>>>
>>>> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>"
>>>>
>>>> as the commit message.  With the correct commit message, are you happy
>>>> with it?
>>>
>>> Yes.
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>
>> Are you planning to resend this series?
> 
> I'm not - you said previously that you had merged the first three
> patches into the phy tree, which are fine.  The next two could be

No, I haven't merged patches from this series. That would have failed
compilation since Grygorii modified enum phy_mode which is used in this series.
You have also noted this in your cover letter.

Thanks
Kishon
