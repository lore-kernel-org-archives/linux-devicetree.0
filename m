From: Josh Boyer <jwboyer-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] dt: Remove obsolete description of powerpc boot
	interface
Date: Mon, 31 Jan 2011 06:36:57 -0500
Message-ID: <20110131113657.GC13541@zod.rchland.ibm.com>
References: <20110131073918.9058.37628.stgit@localhost6.localdomain6>
	<20110131074502.9058.11473.stgit@localhost6.localdomain6>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110131074502.9058.11473.stgit-bi+AKbBUZKagILUCTcTcHdKyNwTtLsGr@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 31, 2011 at 12:45:05AM -0700, Grant Likely wrote:
>32 and 64 bit powerpc support has been merged for a while now, but
>the booting-without-of.txt document still describes 32 bit as not
>supporting multiplatform, which is no longer true.  This patch fixes
>the documentation.
>
>Also remove references to powerpc-specific details outside of section
>I in preparation to add details for other architectures.

There's a line around 500 that starts:

	"The kernel powerpc generic code does..."

Perhaps the powerpc reference should be dropped there?

Also, there are several mentions of "real Open Firmware", which are
probably just fine, and prom_init(), which are probably arch specific.

There is a section that talks about ranges that starts with:

	"For a new 64-bit powerpc board, I...".

Section III 5) has all kinds of powerpc specific stuff.  CHRP,
pSeries, PAPR in the root node.  The references to Apple machines for
examples are probably OK, but it shouldn't make PowerPC items as
explicit requirements.

Section III 5e) references a file that doesn't exist:
arch/ppc64/kernel/setup.c

Section V, paragraph 2 references a file that doesn't exist:
arch/ppc64/kernel/prom.c

Hope that helps you...

josh
