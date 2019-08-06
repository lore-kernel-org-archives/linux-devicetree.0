From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] of/platform: Fix fn definitons for of_link_is_valid()
 and of_link_property()
Date: Tue, 6 Aug 2019 15:20:21 -0600
Message-ID: <CAL_JsqJ9P+HGE6OVASv8AqkozoFEkaiC6Er4LH=S3KHv202JCw@mail.gmail.com>
References: <20190806192654.138605-1-saravanak@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190806192654.138605-1-saravanak@google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frank Rowand <frowand.list@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Android Kernel Team <kernel-team@android.com>, devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 6, 2019 at 1:27 PM Saravana Kannan <saravanak@google.com> wrote:
>
> of_link_is_valid() can be static since it's not used anywhere else.
>
> of_link_property() return type should have been int instead of bool.
>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/of/platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
