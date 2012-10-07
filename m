From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: sata_highbank: mismatch in reference
Date: Sun, 7 Oct 2012 18:06:30 +0100
Message-ID: <CACxGe6uho2BJR=xjR7SOadpHyCPiCoTVc=Z+XzK85NsT1mpkvQ@mail.gmail.com>
References: <CAG27Bk2kP7TvCG2m4Q_ke-RauNUufZ4H6yQqXdNom-V0BTNpxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CAG27Bk2kP7TvCG2m4Q_ke-RauNUufZ4H6yQqXdNom-V0BTNpxA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: kerolasa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Robert Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Oct 7, 2012 3:05 PM, "Sami Kerola" <kerolasa-X3B1VOXEql0@public.gmane.org> wrote:
>
> FYI maintainers,
>
> I tried to compile linus git kernel (v3.6-7996-g0b8e74c) and got
> mismatch warning. I am not sure, but the warning might have something
> to do config option CONFIG_OPTIMIZE_INLINING=y. Here are the
> interesting lines from compilation attempt.
>
> WARNING: drivers/ata/sata_highbank.o(.data+0x0): Section mismatch in
> reference from the variable ahci_highbank_driver to the function
> .init.text:ahci_highbank_probe()
> The variable ahci_highbank_driver references
> the function __init ahci_highbank_probe()
> If the reference is valid then annotate the
> variable with __init* or __refdata (see linux/init.h) or name the variable:
> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

This error means that the _probe and _release hooks need to be changed
from __init to __devinit and __exit to __devexit.

g.
