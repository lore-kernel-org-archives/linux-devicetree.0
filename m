From: Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>
Subject: Re: [PATCH 2/3] libnvdimm: Add a device-tree interface
Date: Fri, 24 Nov 2017 17:36:33 +1100
Message-ID: <87ine018um.fsf@concordia.ellerman.id.au>
References: <20171115175131.23631-1-oohall@gmail.com> <20171115175131.23631-2-oohall@gmail.com> <20171116142840.er7st25ll3o6jr7s@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171116142840.er7st25ll3o6jr7s@rob-hp-laptop>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Oliver O'Halloran <oohall-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-nvdimm-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org
List-Id: devicetree@vger.kernel.org

Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> writes:
> On Thu, Nov 16, 2017 at 04:51:30AM +1100, Oliver O'Halloran wrote:
...
>> diff --git a/drivers/nvdimm/of_nvdimm.c b/drivers/nvdimm/of_nvdimm.c
>> new file mode 100644
>> index 000000000000..765cbbae8bcb
>> --- /dev/null
>> +++ b/drivers/nvdimm/of_nvdimm.c
>> @@ -0,0 +1,202 @@
>> +/*
>> + * Copyright 2017, IBM Corporation
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License as published by
>> + * the Free Software Foundation; either version 2 of the License, or
>> + * (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, you can access it online at
>> + * http://www.gnu.org/licenses/gpl-2.0.html.
>
> This can be SPDX tag.

Specifically:

// SPDX-License-Identifier: GPL-2.0+
/*
 * Copyright 2017, IBM Corporation
 */

...

cheers
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
