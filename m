From: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Subject: Re: [GIT PULL] devicetree changes for v3.3
Date: Sat, 7 Jan 2012 12:41:25 -0800
Message-ID: <CA+55aFzWaKBQU-XRYtu0WGq1328nX3hbHDjcn3etOTPsyA=xcw@mail.gmail.com>
References: <CACxGe6udggDJ2QCRXGKzPwHUwzPsFLPZ1Ogc-Negx9z=UHEntg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <CACxGe6udggDJ2QCRXGKzPwHUwzPsFLPZ1Ogc-Negx9z=UHEntg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 4, 2012 at 11:11 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> Hi Linus,
>
> Please pull the following device tree changes queued up for 3.3.
>
> There is a signed tag for this pull request: devicetree-for-linus-20120104
>
> The following changes since commit 805a6af8dba5dfdd35ec35dc52ec0122400b26=
10:
>
> =A0Linux 3.2 (2012-01-04 15:55:44 -0800)
>
> are available in the git repository at:
> =A0git://git.secretlab.ca/git/linux-2.6 devicetree/merge

Ok, so I pulled the tags, but only because I noticed that you mentioned it.

It would have been much more convenient if you had just named the tag
in the pull request directly, so that it would have said

> are available in the git repository at:
> =A0git://git.secretlab.ca/git/linux-2.6 devicetree-for-linus-20120104

and then my normal "cut-and-paste the pull request line" JustWorks(tm).

Of course, since you use those ugly tag names, I then end up editing
the first line so that the shortlog doesn't fill up with random crud,
so I'd actually prefer for the tag-name to not have that silly date in
it. The tag itself is dated, so the date information actually does
exist inside of it - and if I pull the signed tag, it will then exist
hidden in the merge too (and can be shown using the new "git show
--show-signature" thing):

  commit 02550d61f49266930e674286379d3601006b2893
  merged tag 'devicetree-for-linus-20120104'
  gpg: Signature made Wed 04 Jan 2012 11:07:51 PM PST using RSA key ID 760F=
D901
  gpg: Good signature from "Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>"
  Merge: 2d51daaa615e c89810acbcf4
  Author: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
  Date:   Sat Jan 7 12:18:52 2012 -0800

      Merge tag 'devicetree-for-linus' of git://git.secretlab.ca/git/linux-=
2.6

      devicetree/next changes queued for v3.3 merge window

      * tag 'devicetree-for-linus-20120104' of
git://git.secretlab.ca/git/linux-2.6:
        ARM: prom.h: Fix build error by removing unneeded header file
        irq: check domain hwirq range for DT translate
        dt: add empty of_get_node/of_put_node functions
        of/pdt: fix section mismatch warning
  ...

so for a *really* nice pull request, I'd actually have preferred the
tag to just be named "devicetree-for-linus" (and the next time you
send me a pull request, you just overwrite it - use the "-f" flag for
git tag to say that you want to force the overwrite).

                      Linus
