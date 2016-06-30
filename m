From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [V5, 2/3] powerpc/opal: Add inline function to get rc from an ASYNC_COMP opal_msg
Date: Thu, 30 Jun 2016 22:36:40 +1000 (AEST)
Message-ID: <3rgJvD18wYz9t0V@ozlabs.org>
References: <1467171519-19882-2-git-send-email-sjitindarsingh@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1467171519-19882-2-git-send-email-sjitindarsingh@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linuxppc-dev@lists.ozlabs.org
Cc: robh@kernel.org, arnd@arndb.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, paulus@samba.org, sjitindarsingh@gmail.com
List-Id: devicetree@vger.kernel.org

On Wed, 2016-29-06 at 03:38:38 UTC, Suraj Jitindar Singh wrote:
> An opal_msg of type OPAL_MSG_ASYNC_COMP contains the return code in the
> params[1] struct member. However this isn't intuitive or obvious when
> reading the code and requires that a user look at the skiboot
> documentation or opal-api.h to verify this.
> 
> Add an inline function to get the return code from an opal_msg and update
> call sites accordingly.
> 
> Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d0226d315dba5e401a124b394a

cheers
