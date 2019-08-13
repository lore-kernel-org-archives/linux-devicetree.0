From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] devicetree: Expose dtbs_check and dt_binding_check some more
Date: Tue, 13 Aug 2019 16:32:48 -0600
Message-ID: <CAL_JsqLivZNf9A2bVXKf8eqdmsywQV+KEh5dYVLywNQPfn0P=w@mail.gmail.com>
References: <20190813183825.9605-1-sboyd@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190813183825.9605-1-sboyd@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, devicetree@vger.kernel.org, Linux Doc Mailing List <linux-doc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Tue, Aug 13, 2019 at 12:38 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> It wasn't obvious that this was a command to run based on 'make help',
> so add it to the top-level help for devicetree builds. Also, add an
> example to the documentation to show that db_binding_check can be run
> with DT_SCHEMA_FILES= to only check one schema file instead of all of
> them.
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: <linux-kbuild@vger.kernel.org>
> Cc: <devicetree@vger.kernel.org>
> Cc: <linux-doc@vger.kernel.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> ---
>
> I didn't find this sent, so sending again!

You had. :)

>
>  Documentation/devicetree/writing-schema.md | 1 +
>  Makefile                                   | 6 ++++--
>  2 files changed, 5 insertions(+), 2 deletions(-)

writing-schema.md got converted to rst, so I fixed up and applied.

Rob
