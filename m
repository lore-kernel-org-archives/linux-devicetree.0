From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH] EDAC: Convert to using %pOF instead of full_name
Date: Wed, 19 Jul 2017 07:44:14 +0200
Message-ID: <20170719054414.GC26030@nazgul.tnic>
References: <20170718214339.7774-19-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170718214339.7774-19-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-edac@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Jul 18, 2017 at 04:42:59PM -0500, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-edac@vger.kernel.org
> ---
>  drivers/edac/cpc925_edac.c | 2 +-
>  drivers/edac/ppc4xx_edac.c | 8 ++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
--
