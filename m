From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH 3/3 v2] clk: qoriq: update clock driver
Date: Wed, 24 Oct 2018 13:37:28 -0500
Message-ID: <d4598171243a37516faae71095eb3126d77fa723.camel@buserror.net>
References: <20181024021122.3942-1-andy.tang@nxp.com>
         <20181024021122.3942-2-andy.tang@nxp.com>
         <20181024021122.3942-3-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181024021122.3942-3-andy.tang@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.tang@nxp.com, sboyd@kernel.org, mturquette@baylibre.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-10-24 at 10:11 +0800, andy.tang@nxp.com wrote:
> From: Yuantian Tang <andy.tang@nxp.com>
> 
> Legacy bindings are deleted. So the legacy support in driver
> can be deleted safely.

NACK (both this and 2/3).  The legacy support is intended to preserve
compatibility, regardless of what the dts files in the current kernel tree do.
 If years later we find it's been broken for a while and nobody complained,
then maybe it'll be time to remove it, but why deliberately throw away
compatibility the instant the users have been removed from reference DTs that
might be copied by board vendors, etc?

Note that even if we didn't care about long-term compatibility at all,
removing the support in the same patchset as the change to the dts files means
that the patches can't go in via separate trees (though if that's still the
intent, you should make it clear who you're asking to take what by putting
them in separate patchsets).

-Scott
