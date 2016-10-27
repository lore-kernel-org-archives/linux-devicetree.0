From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [RFC PATCH 06/13] of: Remove prefix "__of_" and prefix "__" from
 local function names
Date: Thu, 27 Oct 2016 07:47:26 -0500
Message-ID: <CAL_JsqL9KWw7Mkz8nwZWDot+3OPBC2AesYuvu3dEofiB7BGeGQ@mail.gmail.com>
References: <1477429146-27039-1-git-send-email-frowand.list@gmail.com> <1477429146-27039-7-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1477429146-27039-7-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Rowand <frowand.list@gmail.com>
Cc: Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Oct 25, 2016 at 3:58 PM,  <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@am.sony.com>

I prefer to leave the prefixes and this is getting into pointless churn.

>
> Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
> ---
>  drivers/of/resolver.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
