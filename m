From: Chris Metcalf <cmetcalf@ezchip.com>
Subject: Re: [RFC PATCH] EDAC: Cleanup atomic_scrub mess
Date: Fri, 22 May 2015 16:13:22 -0400
Message-ID: <555F8DE2.4060402@ezchip.com>
References: <1431991481-25684-1-git-send-email-lho@apm.com>
 <1431991481-25684-2-git-send-email-lho@apm.com>
 <20150519170308.GL4641@pd.tnic>
 <CAPw-ZT=mTpt_vz+e=rM5ywK8feNKkJQrpEWg=noRCziJ0840TQ@mail.gmail.com>
 <20150519203336.GP4641@pd.tnic> <20150521180719.GE3689@pd.tnic>
 <20150521181157.GF3689@pd.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20150521181157.GF3689@pd.tnic>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Borislav Petkov <bp@alien8.de>, Loc Ho <lho@apm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, ".
 Maciej W. Rozycki" <macro@codesourcery.com>, x86@kernel.org, Russell King <linux@arm.linux.org.uk>, Markos Chandras <markos.chandras@imgtec.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Jon Masters <jcm@redhat.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, "patches@apm.com" <patches@apm.com>, Ralf Baechle <ralf@linux-mips.org>, Rob Herring <robh+dt@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Doug Thompson <dougthompson@xmission.com>, "Steven J. Hill" <Steven.Hill@imgtec.com>, Paul Mackerras <paulus@samba.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 05/21/2015 02:11 PM, Borislav Petkov wrote:
> From: Borislav Petkov<bp@suse.de>
>
> So first of all, this atomic_scrub() function's naming is bad. It looks
> like an atomic_t helper. Change it to edac_atomic_scrub().
>
> The bigger problem is that this function is arch-specific and every new
> arch which doesn't necessarily need that functionality still needs to
> define it, otherwise EDAC doesn't compile.
>
> So instead of doing that and including arch-specific headers, have each
> arch define an EDAC_ATOMIC_SCRUB symbol which can be used in edac_mc.c
> for ifdeffery. Much cleaner.
>
> We already are doing this with another symbol - EDAC_SUPPORT. This is
> also much cleaner than having CONFIG_EDAC explicitly depend on all the
> arches which need/have EDAC support and drivers.
>
> This way I can kill the useless edac.h header in tile too.
>
> Signed-off-by: Borislav Petkov<bp@suse.de>

Acked-by: Chris Metcalf <cmetcalf@ezchip.com> [for tile]

-- 
Chris Metcalf, EZChip Semiconductor
http://www.ezchip.com
