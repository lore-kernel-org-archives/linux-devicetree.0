From: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 0/1] How to choose system timer?
Date: Thu, 10 Nov 2011 14:10:22 +0100
Message-ID: <1320930623-15060-2-git-send-email-monstr@monstr.eu>
References: <1320930623-15060-1-git-send-email-monstr@monstr.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1320930623-15060-1-git-send-email-monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org
Cc: michal.simek-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, john.williams-g5w7nrANp4BDPfheJLI6IQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

I have one design question about specifying system timer in DTS.
Our proposed solution is to specify system-timer in chosen
node and then Linux kernel probe it.

For example:
	chosen {
		bootargs = " console=ttyS0,115200 ";
		linux,stdout-path = "/plb@0/serial@83e00000";
		system-timer = <&xps_timer_0>;
	} ;

Is it correct solution? We would like to use 
standard solution and not to reinvent the wheel.
How others archs handle it? AFAIK you have internal cpu
timer which is used as system timer.

I have also attached the patch for microblaze to show probing.

Thanks,
Michal



*** BLURB HERE ***

Peter A. G. Crosthwaite (1):
  microblaze: Added fdt chosen capability for timer

 arch/microblaze/kernel/timer.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

-- 
1.7.5.4
