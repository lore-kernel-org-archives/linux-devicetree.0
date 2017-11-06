From: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH] [net-next?] of: add of_property_read_variable_* dummy helpers
Date: Mon, 06 Nov 2017 09:54:44 -0500
Message-ID: <871slb1mq3.fsf@weeman.i-did-not-set--mail-host-address--so-tickle-me>
References: <20171106132627.150459-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171106132627.150459-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "David S . Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> writes:

> Commit a67e9472da42 ("of: Add array read functions with min/max size
> limits") added a new interface for reading variable-length arrays from
> DT properties. One user was added in dsa recently and this causes a
> build error because that code can be built with CONFIG_OF disabled:
>
> net/dsa/dsa2.c: In function 'dsa_switch_parse_member_of':
> net/dsa/dsa2.c:678:7: error: implicit declaration of function 'of_property_read_variable_u32_array'; did you mean 'of_property_read_u32_array'? [-Werror=implicit-function-declaration]
>
> This adds a dummy functions for of_property_read_variable_u32_array()
> and a few others that had been missing here. I decided to move
> of_property_read_string() and of_property_read_string_helper() in the
> process to make it easier to compare the two sets of function prototypes
> to make sure they match.
>
> Fixes: 975e6e32215e ("net: dsa: rework switch parsing")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

I missed the missing stub for of_property_read_variable_u32_array with
!CONFIG_OF. Thank you for the quick fix!

Reviewed-by: Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
