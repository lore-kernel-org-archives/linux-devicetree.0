From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 1/4] Document nexus nodes/specifier remapping
Date: Fri, 2 Feb 2018 14:10:10 -0600
Message-ID: <CAL_JsqJuFOR7-tH5Z2-Dd0Mgo1iJFcpPstN6qHFYCr9NXjnuEw@mail.gmail.com>
References: <20180131023618.14292-1-stephen.boyd@linaro.org> <20180131023618.14292-2-stephen.boyd@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180131023618.14292-2-stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Jan 30, 2018 at 8:36 PM, Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
> Document the generic nexus node properties. This can be used by
> any specifier that conforms to #<specifier>-cells where they
> want to support remapping phandle lists through nexus nodes. This
> is similar to interrupt remapping, but slightly different because
> we don't consider unit addresses when doing mappings. This is
> mostly a copy/paste of the interrupt specification, with the unit
> address parts removed and generalized to any specifier. There's
> also the addition of a pass through mechanism to make things more
> compact if desired in the mapping table.
>
> Signed-off-by: Stephen Boyd <stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  source/devicetree-basics.rst | 206 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 206 insertions(+)

I've applied this. I'm considering in pending until we do another
release if anyone cares to chime in on this.

I'll queue the rest to the kernel for 4.17.

Rob
