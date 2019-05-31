From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH V4 net-next 0/6] Peer to Peer One-Step time stamping
Date: Thu, 30 May 2019 22:51:32 -0700
Message-ID: <20190531055132.7qrjuqgtw6qw4mgh@localhost>
References: <cover.1559109076.git.richardcochran@gmail.com>
 <20190530.115507.1344606945620280103.davem@davemloft.net>
 <20190530.125833.1049383711116106790.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190530.125833.1049383711116106790.davem@davemloft.net>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com, jacob.e.keller@intel.com, mark.rutland@arm.com, mlichvar@redhat.com, robh+dt@kernel.org, willemb@google.com
List-Id: devicetree@vger.kernel.org

On Thu, May 30, 2019 at 12:58:33PM -0700, David Miller wrote:
> I had to revert, this doesn't build.

Sorry I missed macvlan, and thanks for the 'uninitialized' warning.
It was a real latent bug.  I wonder why my linaro 7.4 gcc didn't flag
that...

Anyhow, I rebased v5 of my series to latest net-next, and I'm getting
a lot of these:

In file included from net/ipv6/af_inet6.c:45:0:
./include/linux/netfilter_ipv6.h: In function ‘nf_ipv6_br_defrag’:
./include/linux/netfilter_ipv6.h:110:9: error: implicit declaration of function ‘nf_ct_frag6_gather’; did you mean ‘nf_ct_attach’? [-Werror=implicit-function-declaration]
  return nf_ct_frag6_gather(net, skb, user);
         ^~~~~~~~~~~~~~~~~~
         nf_ct_attach


Thanks,
Richard
