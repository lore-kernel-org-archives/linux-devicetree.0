From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v6 07/18] of: dynamic: change type of of_{at,de}tach_node() to void
Date: Wed, 07 Nov 2018 23:08:28 +1100
Message-ID: <87tvktqedf.fsf@concordia.ellerman.id.au>
References: <1541431515-25197-1-git-send-email-frowand.list@gmail.com> <1541431515-25197-8-git-send-email-frowand.list@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1541431515-25197-8-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Alan Tull <atull@kernel.org>, Moritz Fischer <mdf@kernel.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, linux-fpga@vger.kernel.org
List-Id: devicetree@vger.kernel.org

frowand.list@gmail.com writes:

> From: Frank Rowand <frank.rowand@sony.com>
>
> of_attach_node() and of_detach_node() always return zero, so
> their return value is meaningless.

But should they always return zero?

At least __of_attach_node_sysfs() can fail in several ways.

And there's also this in __of_detach_node() which should probably be
returning an error:

	if (WARN_ON(of_node_check_flag(np, OF_DETACHED)))
        	return;


Seems to me we should instead be fixing these to propagate errors,
rather than hiding them?

cheers
