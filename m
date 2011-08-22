From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC PATCH 0/2] WIP: generic OF pinmux binding
Date: Mon, 22 Aug 2011 12:59:16 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04B24A368D@HQMAIL01.nvidia.com>
References: <1313581648-22303-1-git-send-email-jamie@jamieiles.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1313581648-22303-1-git-send-email-jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org" <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>, "konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Jamie Iles wrote at Wednesday, August 17, 2011 5:47 AM:
> To avoid going too far in the wrong direction I thought I'd post what I
> have so far for a generic pinmux binding.  Essentially it's just
> Stephen's nvidia binding but with the nvidia specifics abstracted out so
> the common loop can be used for other platforms.  This approach works
> nicely for picoxcell too.
> 
> For more esoteric bindings, such as pull strength, these could be
> handled in the platform specific configuration function.

Thanks very much. These patches look sane to me. I'll pick them up in my
local tree, enhance them to support the pins/additional-pins property that
I just mentioned in a separate email, retest and repost.

> This doesn't address the runtime muxing that LinusW's set of patches do,
> and I'm not sure how to handle that.

I see that LinusW just posted another version of this. I'll go check that
out too, in case it has any impact on these patches.

-- 
nvpublic
