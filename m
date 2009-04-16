From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Interruption on PCI Bus
Date: Thu, 16 Apr 2009 08:20:04 -0600
Message-ID: <fa686aa40904160720s77efa749u56392d7027467a4a@mail.gmail.com>
References: <49E6E542.5090504@fr.thalesgroup.com>
	<49E6F14A.9010800@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <49E6F14A.9010800-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 16, 2009 at 2:50 AM, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org> wrote:
> Sorry for being so vague. =A0As the person who originally devised this
> interrupt tree stuff, I'm pretty sure about the intention, but much less
> sure about what specific versions of Linux and U-Boot actually do.
> =A0Hopefully someone else can give you a definitive answer about that.

U-Boot doesn't really do anything with interrupts.  It usually just
polls everything.

Linux arch/powerpc does walk the device tree to get irq routing and
resolve to a Linux-internal virtual IRQ number.  I'm pretty sure that
the IRQ registers are normally ignored unless something goes wrong
with parsing the tree.  See arch/powerpc/kernel/pci-common.c and
search for of_irq_map_pci().

g.

-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
