From: Kim Phillips <kim.phillips@freescale.com>
Subject: Re: [PATCH 1/5] treewide: include libfdt_env.h before fdt.h
Date: Thu, 17 Jan 2013 11:54:56 -0600
Message-ID: <20130117115456.71a38e3275230cdbb175bfe4@freescale.com>
References: <20130116175904.47ee25bd2596f28796698759@freescale.com>
	<1358382963.18317.17@snotra>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1358382963.18317.17@snotra>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Scott Wood <scottwood@freescale.com>
Cc: u-boot@lists.denx.de, devicetree-discuss@lists.ozlabs.org, Gibson <david@gibson.dropbear.id.au>, David@theia.denx.de
List-Id: devicetree@vger.kernel.org

On Wed, 16 Jan 2013 18:36:03 -0600
Scott Wood <scottwood@freescale.com> wrote:

> On 01/16/2013 05:59:04 PM, Kim Phillips wrote:
> > and, if including libfdt.h which includes libfdt_env.h in
> > the correct order, don't include fdt.h before libfdt.h.
> > 
> > this is needed to get the fdt type definitions set from
> > the project environment before fdt.h uses them.
> > 
> > Signed-off-by: Kim Phillips <kim.phillips@freescale.com>
> > Cc: Jerry Van Baren <gvb.uboot@gmail.com>
> 
> Maybe fdt.h should include libfdt_env.h?
> 
> Or just always use libfdt.h as the public header.

Was just following along the same lines as the dtc commits 38ad79d3
"dtc/tests: don't include fdt.h prior to libfdt.h" and 20b866a7
"dtc/fdtdump: include libfdt_env.h prior to fdt.h", acked by David
G.  I don't know why some only include fdt.h.

devicetree-discuss/David: is there a prescribed way to go here?
Change all fdt.h includers to just always include libfdt.h instead
of libfdt_env.h prior to fdt.h?

Kim
