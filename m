From: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] arm: mvebu: Enable USB controllers on Armada
 370/XP boards
Date: Wed, 23 Jan 2013 15:08:02 -0300
Message-ID: <CALF0-+W+dU5jvTeiX8pLan1hre7+Db3krD3KnW0XoFRvfkkoXQ@mail.gmail.com>
References: <1358954792-16160-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<1358954792-16160-2-git-send-email-ezequiel.garcia@free-electrons.com>
	<CALF0-+XJEXJ2B3NLu5DvyxaDuuMNP=zk+z8QUd4GTQULW3BpyA@mail.gmail.com>
	<20130123190352.2d001218@skate>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130123190352.2d001218@skate>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On Wed, Jan 23, 2013 at 3:03 PM, Thomas Petazzoni
<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> On Wed, 23 Jan 2013 14:04:42 -0300, Ezequiel Garcia wrote:
>
>> from the OpenBlocks AX3-4 board dts file, since you mentioned this
>> board uses that USB
>> port for a PCIe connector -- if I understood correctly.
>
> No. The OpenBlocks has a different USB controller that sits on the PCIe
> bus. There is nothing like a PCIe port that uses a USB port, that
> doesn't make sense.
>

Mmm... indeed, I got it completely wrong.

>> So, IMHO, if OpenBlocks uses third USB port to connect some PCIe
>> controller, we should activate it in the dts file.
>>
>> What do you think?
>
> No, see above.
>

So, what do you think about the patch series to be pushed as it is?

-- 
    Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
