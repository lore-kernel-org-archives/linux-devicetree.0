From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/1] doc: bindings: fix bad reference to ARM CPU bindings
Date: Wed, 16 Jan 2019 13:02:16 -0600
Message-ID: <CAL_JsqK_oHtYxCh+9yF11XoPoEVQ7yakyDDG-OJfQMgYhC4yWA@mail.gmail.com>
References: <08ea3e964c337df6ef532ac4586f488edab80048.1546991072.git.ottosabart@seberm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <08ea3e964c337df6ef532ac4586f488edab80048.1546991072.git.ottosabart@seberm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Otto Sabart <ottosabart@seberm.com>
Cc: devicetree@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 8, 2019 at 5:47 PM Otto Sabart <ottosabart@seberm.com> wrote:
>
> The primecell.txt and cpus.txt files were converted into YAML. This
> patch updates old references with new ones.
>
> Fixes: d3c207eeb905 ("dt-bindings: arm: Convert primecell binding to json-schema")
> Fixes: 672951cbd1b7 ("dt-bindings: arm: Convert cpu binding to json-schema")
> Signed-off-by: Otto Sabart <ottosabart@seberm.com>
> ---
>  Documentation/devicetree/bindings/arm/cpu-capacity.txt          | 2 +-
>  Documentation/devicetree/bindings/arm/idle-states.txt           | 2 +-
>  Documentation/devicetree/bindings/arm/sp810.txt                 | 2 +-
>  Documentation/devicetree/bindings/arm/topology.txt              | 2 +-
>  Documentation/devicetree/bindings/display/arm,pl11x.txt         | 2 +-
>  .../devicetree/bindings/interrupt-controller/arm,gic-v3.txt     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

Rob
