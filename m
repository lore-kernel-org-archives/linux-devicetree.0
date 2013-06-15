From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Device tree flattening code not copying properties from blob
Date: Sat, 15 Jun 2013 20:53:47 +0100
Message-ID: <CACxGe6s0XoeE99ppvATwWe4jfV2cg+7sDPZAEKowy31wugSBCw@mail.gmail.com>
References: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF696@corpatsmail4.corp.sensis.com>
 <CACxGe6sdsXp0g9MJ2npupQedXpnge7kp_v=BqnErf+J6oXnyeg@mail.gmail.com>
 <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEF975@corpatsmail4.corp.sensis.com>
 <CACxGe6s+Br8mYDfULsDcA9Ym3mqtyXZ41uK1un-nzcZH0BHtDg@mail.gmail.com>
 <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEFA19@corpatsmail4.corp.sensis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <8BE8E6569B96CE4AA5EDE9F8314B7FB1EEFA19-gEjpXB0kThW1wM3WIAwN2vV4jgPAACGKVpNB7YpNyf8@public.gmane.org>
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
To: "Collins, Rod" <Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 14, 2013 at 4:55 PM, Collins, Rod
<Rod.Collins-eu1g02Y2shuDvotElmWtJA@public.gmane.org> wrote:
> Grant
>
> That makes perfect sense, but I find that the DTB is included in the
> vmlinux.lds.h file which lives in source/include/asm-generic.
>
> This seems to always want to put the dtb in the init section which gets
> removed. To fix this the asm-generic/vmlinux.lds.h file would need to be
> changed.
>
> Forgive me ahead of time for not understanding all of the versions and
> the intents. We are using the 3.7 kernel in the uCLinux distribution.
>
> It seems to me that it should always be added to rodata when linked in,
> unless it is passed as a command line parameter?

Linking the DTB into the kernel-proper (by that I mean the vmlinux
binary) is actually not the typical use case for DT. Normally the DTB
is either passed in by the bootloader (preferred), or attached (not
linked) to the kernel binary as part of the zImage wrapper (for
backwards compatibility with non-DT enabled bootloaders). Both PowerPC
and ARM support both methods. Linking into the vmlinux image has
problems that I've discussed in my other reply. If the linked-in
method is used, then it is *required* for the kernel to copy it into
safe memory before unflattening the tree. The assumption with the
dtb.S target is that multiple DTBs may be linked into the kernel, but
only one will actually get used. In that situation the kernel should
discard all the unused DTB data. The easiest way to do that is put all
the DTBs in the __init rodata section and then copy only the DTB that
is actually used.

g.
