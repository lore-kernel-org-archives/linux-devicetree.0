From: Timur Tabi <timur@tabi.org>
Subject: Re: [PATCH v2] of/base: release the node correctly in of_parse_phandle_with_args()
Date: Tue, 16 Apr 2013 06:37:21 -0500
Message-ID: <CAOZdJXW8qKccGKic3R4o1aqJdbfHcBoAp62B4HPFnF=sUAEvuQ@mail.gmail.com>
References: <1365564999-24427-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1365564999-24427-1-git-send-email-Yuantian.Tang@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yuantian.Tang@freescale.com
Cc: Grant Likely <grant.likely@secretlab.ca>, devicetree-discuss <devicetree-discuss@lists.ozlabs.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, lkml <linux-kernel@vger.kernel.org>, Rob Herring <rob.herring@calxeda.com>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 9, 2013 at 10:36 PM,  <Yuantian.Tang@freescale.com> wrote:
>
> +                       /* Found it! return success */

I'm pretty sure this comment is in the wrong place.
