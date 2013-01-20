From: David Linares <daluis-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Subject: ARM: Voipac i.MX25: Support with device tree on v3.8-rc1 or later
Date: Sun, 20 Jan 2013 12:51:57 +0000
Message-ID: <DUB118-W244A6AACB427066AC4EB6DC9100@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


Hi guys,

I have just signed up to this distribution list to try to get some support/understanding of an issue I am having when switching from kernel v3.7.3 to v3.8-rc1.
I am using a Voipac i.MX25 and on v3.7.3, barebox correctly loads the kernel and my board is correctly up and running.
After switching to v3.8-rc1 (in order to get some fixes for a few drivers), barebox doesn't seem to load the kernel anymore, or the kernel initialization doesn't go very far as I don't see any kernel message.
So I had a look at the commits between the two kernel versions and I noticed a commit for iMX25 to use devicetree, so I am pretty sure that would explain my problems at kernel loading time as it is the only commit affecting the boot.
Is there somebody on this mailing list that could help me with devicetree?
At first I would just need to verify that the parameters sent by the bootloader are still correct for devicetree and maybe get a few hints on how to debug this issue and see how far the init has gone.

Thank you very much,
Best regards,
David
 		 	   		  
