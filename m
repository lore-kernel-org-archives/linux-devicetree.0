From: Alban Gruin <alban.gruin@gmail.com>
Subject: Re: [PATCH v2] userdiff: Add a builtin pattern for dts files
Date: Sat, 17 Aug 2019 17:18:19 +0200
Message-ID: <40ec31c4-6f13-a513-6514-93b6c8e84a7f@gmail.com>
References: <20190816225658.8946-1-sboyd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <git-owner@vger.kernel.org>
In-Reply-To: <20190816225658.8946-1-sboyd@kernel.org>
Content-Language: fr-FR
Sender: git-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, git@vger.kernel.org
Cc: Adrian Johnson <ajohnson@redneon.com>, William Duclot <william.duclot@ensimag.grenoble-inp.fr>, Johannes Sixt <j6t@kdbg.org>, Matthieu Moy <matthieu.moy@grenoble-inp.fr>, devicetree@vger.kernel.org, Junio C Hamano <gitster@pobox.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Stephen,

Le 17/08/2019 à 00:56, Stephen Boyd a écrit :
> The Linux kernel receives many patches to the devicetree files each
> release. The hunk header for those patches typically show nothing,
> making it difficult to figure out what node is being modified without
> applying the patch or opening the file and seeking to the context. Let's
> add a builtin 'dts' pattern to git so that users can get better diff
> output on dts files when they use the diff=dts driver.
> 
> The regex has been constructed based on the spec at devicetree.org[1]
> 
> [1] https://github.com/devicetree-org/devicetree-specification/releases/latest
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
> 
> Sending this again after getting feedback and it getting stuck in
> review[1]. I'm not sure what happened with the meta question from Junio
> to add a way for various projects to introduce their own patterns,

Nothing happened, AFAIK.

> but
> I'd still prefer to have this in git proper because the kernel uses git
> extensively and we rely on git formatted patches in our workflow. I
> recently reviewed a dts change and remembered this never got accepted.
> 
> Changes from v1:
>  * Updated regex to handle anything after node names instead of
>    requiring a '{'
>  * Updated test for boolean relation operators
>  * Sent out a patch to devicetree spec to document % operator
> 
> [1] Feedback was in 16335abe-5e7e-fd7a-25f4-373f94e176e1@gmail.com
> 
>  -%<-
This looks good to me.

Cheers,
Alban
