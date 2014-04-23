From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 00/21] FDT clean-ups and libfdt support
Date: Thu, 24 Apr 2014 01:04:47 +0400
Message-ID: <CAMo8Bf+LO-15x8vhOukskyaNMMu97NzFjmkc-inO9xqG075dkw@mail.gmail.com>
References: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-bounces@lists.openrisc.net>
In-Reply-To: <1398215901-25609-1-git-send-email-robherring2@gmail.com>
List-Unsubscribe: <http://lists.openrisc.net/options/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=unsubscribe>
List-Archive: <http://lists.openrisc.net/pipermail/linux>
List-Post: <mailto:linux@lists.openrisc.net>
List-Help: <mailto:linux-request@lists.openrisc.net?subject=help>
List-Subscribe: <http://lists.openrisc.net/listinfo/linux>,
	<mailto:linux-request@lists.openrisc.net?subject=subscribe>
Sender: linux-bounces@lists.openrisc.net
Errors-To: linux-bounces@lists.openrisc.net
To: Rob Herring <robherring2@gmail.com>
Cc: linux-mips@linux-mips.org, Aurelien Jacquiot <a-jacquiot@ti.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, "H. Peter Anvin" <hpa@zytor.com>, Paul Mackerras <paulus@samba.org>, linux@lists.openrisc.net, Rob Herring <robh@kernel.org>, Russell King <linux@arm.linux.org.uk>, linux-c6x-dev@linux-c6x.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Mark Salter <msalter@redhat.com>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Thomas Gleixner <tglx@linutronix.de>, linux-metag@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, linuxp
List-Id: devicetree@vger.kernel.org

On Wed, Apr 23, 2014 at 5:18 AM, Rob Herring <robherring2@gmail.com> wrote:
> From: Rob Herring <robh@kernel.org>
>
> This is a series of clean-ups of architecture FDT code and converts the
> core FDT code over to using libfdt functions. This is in preparation
> to add FDT based address translation parsing functions for early
> console support. This series removes direct access to FDT data from all
> arches except powerpc.
>
> The current MIPS lantiq and xlp DT code is buggy as built-in DTBs need
> to be copied out of init section. Patches 2 and 3 should be applied to
> 3.15.
>
> Changes in v2 are relatively minor. There was a bug in the unflattening
> code where walking up the tree was not being handled correctly (thanks
> to Michal Simek). I re-worked things a bit to avoid globally adding
> libfdt include paths.
>
> A branch is available here[1], and I plan to put into linux-next in a few
> days. Please test! I've compiled on arm, arm64, mips, microblaze, xtensa,
> and powerpc and booted on arm and arm64.
>
> Rob
>
> [1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git libfdt

For xtensa: Tested-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
