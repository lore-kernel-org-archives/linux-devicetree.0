From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: [PATCH] dtc: Fix zero-length input segfault
Date: Fri, 17 Feb 2012 09:14:39 -0600
Message-ID: <E1RyPWB-0000Ts-1g@jdl.com>
References: <1328605373-14063-1-git-send-email-hkronsto@frequentis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1328605373-14063-1-git-send-email-hkronsto-USXAA5bZaHGDvotElmWtJA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Horst Kronstorfer <hkronsto-USXAA5bZaHGDvotElmWtJA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> This patch fixes a segmentation fault caused by dereferencing a NULL
> pointer (pos->file aka yylloc.file) in srcpos_string when the input
> length is 0 (fe 'dtc </dev/null'.) Reason: yylloc.file is initialized
> with 0 and the tokenizer, which updates yylloc.file via srcpos_update
> doesn't get a chance to run on zero-length input.
> 
> Signed-off-by: Horst Kronstorfer <hkronsto-USXAA5bZaHGDvotElmWtJA@public.gmane.org>

Applied.

Thanks,
jdl
