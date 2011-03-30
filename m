From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Playing with device trees under qemu?
Date: Tue, 29 Mar 2011 23:18:15 -0600
Message-ID: <AANLkTinp4u+23boN1ZCJ0P9EKCuVUA-Tq9yAWkJmP-dV@mail.gmail.com>
References: <4D91B92B.6050009@parallels.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4D91B92B.6050009-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Landley <rlandley-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 29, 2011 at 4:49 AM, Rob Landley <rlandley-bzQdu9zFT3WakBO8gow8eQ@public.gmane.org> wrote:
> Google is being unhelpful here. =A0If I want to:
>
> A) play around with the recent device tree support patches for the kernel
>
> B) boot them under QEMU
>
> Where do I go? =A0The closest thing to a device trees website google
> finds is http://elinux.org/Device_Trees which doesn't mention qemu at
> all. =A0There was a CELF proposal last year to add device tree support to
> qemu, which is inexplicably attributed to me:
>
> http://elinux.org/CELF_Project_Proposal/Add_Device_Tree_emulation_support=
_to_QEMU
>
> And google also found http://www.linux-kvm.org/wiki/images/f/fe/2010-foru=
m-armbru-qdev.pdf
> and a kvm (not qemu) status page http://www.linux-kvm.org/page/Qdev_status
> but none of them are the "go here, download this, do that" variety...
>
> Any suggestions, or is it not ripe enough to play with yet?

This is a good starting point, if a bit old.  Things have moved on a
bit since then and I should really write up the QEMU configuration
that I'm currently using.

http://people.canonical.com/~jk/dt-workshop/

g.
