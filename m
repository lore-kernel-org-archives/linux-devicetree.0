From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 07/14] of/platform: Probe "isa" busses by default
Date: Fri, 23 Sep 2016 07:42:47 -0500
Message-ID: <CAL_Jsq+mFreBhUeT9b2J07jo0kmXwrJdzAqpd-8_Tcrfa5i2QA@mail.gmail.com>
References: <20160919212132.28893-1-paul.burton@imgtec.com> <20160919212132.28893-8-paul.burton@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160919212132.28893-8-paul.burton@imgtec.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Burton <paul.burton@imgtec.com>
Cc: Linux-MIPS <linux-mips@linux-mips.org>, Ralf Baechle <ralf@linux-mips.org>, Frank Rowand <frowand.list@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Mon, Sep 19, 2016 at 4:21 PM, Paul Burton <paul.burton@imgtec.com> wrote:
> Since commit 44a7185c2ae6 ("of/platform: Add common method to populate
> default bus") platforms calling of_platform_bus_probe from an initcall
> is either a rather unsafe race with of_platform_default_populate_init or
> a no-op. The MIPS Malta board needs to probe devices under an ISA bus,
> which we do support in the of_busses array but until now haven't
> included in of_default_bus_match_table.
>
> Add an "isa" entry to of_default_bus_match_table such that we can just
> accept use of of_platform_default_populate_init & remove the
> Malta-specific match table in a later patch.
>
> Signed-off-by: Paul Burton <paul.burton@imgtec.com>

Acked-by: Rob Herring <robh@kernel.org>
