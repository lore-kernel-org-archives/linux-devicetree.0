From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] Rename _B to _XBYTE in libfdt_env.h.
Date: Mon, 09 Apr 2012 10:28:31 -0500
Message-ID: <E1SHGW7-0001qh-4w@jdl.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

[ Drat.  It's devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsieG/Ez6ZCGd0@public.gmane.org  Sorry. -- jdl]

------- Forwarded Message

To: Andrej Krutak <andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
cc: devtree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Michal Marek <mmarek-AlSwsSmVLrQ@public.gmane.org>,
    linux-kbuild-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: Re: [PATCH] Rename _B to _XBYTE in libfdt_env.h.
In-reply-to: <1333434921-14153-1-git-send-email-andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
References: <E1SEpdZ-0000dW-8Z-CYoMK+44s/E@public.gmane.org> <1333434921-14153-1-git-send-email-andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
Comments: In-reply-to Andrej Krutak <andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
   message dated "Tue, 03 Apr 2012 08:35:21 +0200."
Date: Mon, 09 Apr 2012 08:49:04 -0500
From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
X-Spam-Score: -0.0

> The _B macro is also defined by cygwin in ctype.h.
> Rename _B to _XBYTE to better avoid name collisions.
> 
> Signed-off-by: Andrej Krutak <andree-/tK0A0Qp8GRaa/9Udqfwiw@public.gmane.org>
> ---
>  scripts/dtc/libfdt/libfdt_env.h |   11 ++++++-----
>  1 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/dtc/libfdt/libfdt_env.h b/scripts/dtc/libfdt/libfdt_env.h
> index 449bf60..4ec8565 100644
> --- a/scripts/dtc/libfdt/libfdt_env.h
> +++ b/scripts/dtc/libfdt/libfdt_env.h

This patch is against the kernel _copy_ of the DTC sources.
Technically, we'll need it against the upstream sources
as found here:

    git://git.jdl.com/software/dtc.git

Later, the patch will appear in the kernel when it updates
with a newer source drop.

Thanks,
jdl

- --ED70BB7024.1333981658/ozlabs.org--

------- End of Forwarded Message
