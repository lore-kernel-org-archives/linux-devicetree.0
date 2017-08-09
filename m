From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] spmi: Convert to using %pOF instead of full_name
Date: Wed, 9 Aug 2017 16:50:33 -0500
Message-ID: <CAL_Jsq+cNS5WYwc2riXNVrTDz9UnT7jMezrZJHmU0NX53gGCkg@mail.gmail.com>
References: <20170718214339.7774-52-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170718214339.7774-52-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

+Stephen

On Tue, Jul 18, 2017 at 4:43 PM, Rob Herring <robh@kernel.org> wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/spmi/spmi.c | 14 ++++++--------
>  1 file chqanged, 6 insertions(+), 8 deletions(-)

Looks like I missed Stephen recently being added as maintainer. Do you
need me to resend this?

Rob
