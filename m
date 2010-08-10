From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 0/9] Xilinx PCI endpoint driver
Date: Tue, 10 Aug 2010 11:15:11 -0600
Message-ID: <AANLkTim81JjUYzRaiz_X3sh1evKSEfUia39_Lzjr7H-o@mail.gmail.com>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<0f773b9c-7bf4-4795-93e1-64b1f81dd286@VA3EHSMHS028.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <0f773b9c-7bf4-4795-93e1-64b1f81dd286-+Ck8Kgl/v08NTaRkHJHP0bjjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 23, 2010 at 3:39 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> Sorry, I just realized that the NO_IRQ patch is incomplete 'cuz I hadn't
> fixed the
> x86 part... =A0But can you try putting the hwicap fix in the test tree?

Hi Stephen,  I didn't get a chance to look at these before the merge
window opened, and then of course everything else fell to the wayside.
 I'll take a quick look now, but a bunch of devicetree changes went in
that will affect some of your patches, so you'll want to rebase on top
of Linus' current tree sometime soon.

g.
