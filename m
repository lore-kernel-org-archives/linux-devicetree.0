From: Ezequiel Garcia <elezegarcia-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] arm: mvebu: Add support for USB host controllers
 in Armada 370/XP
Date: Tue, 29 Jan 2013 15:56:20 -0300
Message-ID: <CALF0-+Vg1WZA3m9G7mLU92BBuDpGLG-pmMM=XHtGm2UwnXXLUw@mail.gmail.com>
References: <1358954792-16160-1-git-send-email-ezequiel.garcia@free-electrons.com>
	<CALF0-+W8dVLHF66VKni+5ZsQpFd=cGDXE0TD=dRc1B=ptrAMUg@mail.gmail.com>
	<20130123174025.GV1758@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130123174025.GV1758-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Michael Opdenacker <michael.opdenacker-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org, Yehuda Yitschak <yehuday-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Jason,

On Wed, Jan 23, 2013 at 2:40 PM, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org> wrote:
> On Wed, Jan 23, 2013 at 02:06:12PM -0300, Ezequiel Garcia wrote:
>> Jason,
>>
>> On Wed, Jan 23, 2013 at 12:26 PM, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
>> > The Armada 370 and Armada XP SoC has an Orion EHCI USB controller.
>> > This patch adds support for this controller in Armada 370
>> > and Armada XP SoC common device tree files.
>> >
>> > Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
>> > Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > Tested-by: Nobuhiro Iwamatsu <iwamatsu-+mkmVskJBflAfugRpC6u6w@public.gmane.org>
>> > Tested-by: Florian Fainelli <florian-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
>> > Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>> > ---
>> > Changes from v1:
>> >  * Remove uneeded USB_ARCH_HAS_EHCI selection as noted by Florian.
>> >
>> >  arch/arm/boot/dts/armada-370-xp.dtsi |   15 +++++++++++++++
>> >  arch/arm/boot/dts/armada-370.dtsi    |    9 +++++++++
>> >  arch/arm/boot/dts/armada-xp.dtsi     |   17 +++++++++++++++++
>> >  3 files changed, 41 insertions(+), 0 deletions(-)
>>
>> Do you think we're still in time to get this series into v3.9 (given
>> we decide soon on the OpenBlocks issue)?
>
> That shouldn't be a problem.
>

Do you think we can take this series for v3.9 as it is?
I have no problems making any changes if they are needed
but I can't move forward with the OpenBlocks issue since
I don't have access to the hardware.

I think we can sanely merge this as it is, since it has been tested in
every platform.
If there's anything to change we can do it later, when I have more
information about the
OpenBlocks hardware.

Thanks,

-- 
    Ezequiel
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
