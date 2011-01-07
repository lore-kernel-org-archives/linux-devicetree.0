From: "Blanchard, Hollis" <Hollis_Blanchard@mentor.com>
Subject: Re: [RFC] MPIC Bindings and Bindings for AMP Systems
Date: Fri, 7 Jan 2011 08:00:42 -0800
Message-ID: <DD7A9A95166BF4418C4C1EB2033B6EE2038FA900@na3-mail.mgc.mentorg.com>
References: <4D12F171.7010103@mentor.com>
	<20101223185623.GA20384@angua.secretlab.ca>
	<4D13C402.2090209@mentor.com>
	<20101223223325.GK20384@angua.secretlab.ca>
	<20110103135120.32aeb60d@udp111988uds.am.freescale.net>
	<4D24E99F.90908@mentor.com>
	<20110105160918.2b530fea@udp111988uds.am.freescale.net>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA8E4@na3-mail.mgc.mentorg.com>
	<20110105170725.1a82c5a6@udp111988uds.am.freescale.net>
	<DD7A9A95166BF4418C4C1EB2033B6EE2038FA8FD@na3-mail.mgc.mentorg.com>
	<AANLkTikROM4MtmLYEK_6ndRzbDJ3xjMM5iSPzDhpRWLy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-class: urn:content-classes:message
In-Reply-To: <AANLkTikROM4MtmLYEK_6ndRzbDJ3xjMM5iSPzDhpRWLy@mail.gmail.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Scott Wood <scottwood@freescale.com>, "Inge,
	Meador" <meador_inge@mentor.com>, devicetree-discuss@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On 01/07/2011 07:48 AM, Grant Likely wrote:
> Actually, for a while now the kernel has been moving towards userspace
> being responsible for device identification.  That's what udev is for.
>   The kernel udev looks at the available information when a device is
> registered/bound, and it creates useful symlinks to the dynamically
> assigned major/minor devices.  The rest of userspace doesn't need to
> know about it; it can simply use the symlinks in /dev, but it is
> appropriate to let udev figure out the correct naming.
Can you point out an example of how this is done for Open Firmware 
devices currently? In particular, how are the udev rules supposed to 
operate? They get a device path, use that to find additional information 
in /proc/device-tree (hope that's mounted), and then what? Do we 
hardcode the block addresses in the rules, for example @1400 and @2400?

Hollis Blanchard
Mentor Graphics, Embedded Systems Division
