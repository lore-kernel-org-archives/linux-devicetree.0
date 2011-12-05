From: Scott Wood <scottwood@freescale.com>
Subject: Re: [PATCH v2 01/17] fdt: Tidy up a few fdtdec problems
Date: Mon, 5 Dec 2011 16:18:37 -0600
Message-ID: <4EDD433D.4060603@freescale.com>
References: <1322878300-5551-1-git-send-email-sjg@chromium.org>
	<1322878300-5551-2-git-send-email-sjg@chromium.org>
	<4EDD375D.9090509@nvidia.com>
	<CAPnjgZ0h39vB2H4MuCwVqb2Tgcr4==yN8Pj6a3s9dciyXPBu1A@mail.gmail.com>
	<4EDD4091.1030708@nvidia.com>
	<CAPnjgZ36vurCx1yi2PoERBDVMwgkN_HVibHm_5fJ8QAuPKPMeg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <CAPnjgZ36vurCx1yi2PoERBDVMwgkN_HVibHm_5fJ8QAuPKPMeg@mail.gmail.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Simon Glass <sjg@chromium.org>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Tom Warren <TWarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

On 12/05/2011 04:11 PM, Simon Glass wrote:
> Hi Stephen,
> 
> On Mon, Dec 5, 2011 at 2:07 PM, Stephen Warren <swarren@nvidia.com> wrote:
>> My point is that there are probably .dts files using "ok" instead of
>> "okay" or the kernel wouldn't support "ok". People will probably want to
>> use those with U-Boot without changing anything else. So, U-Boot should
>> interpret the FDT in the same way as the kernel.

The kernel has to deal with real Open Firmware systems, some of which
pass buggy trees.  U-Boot should not blindly imitate all of Linux's
workarounds.

> OK, how about:
> 		return 0 == strncmp(cell, "ok", 2);
> 
> (I do feel that if you do this sort of thing you end up with people
> using 'ok' even in new fdts, since they look at code like this and
> think it is fine)

Indeed.

-Scott
