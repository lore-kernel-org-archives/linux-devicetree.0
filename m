From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/3] Documentation: dt: binding: fsl: update property
 description for RCPM
Date: Mon, 3 Sep 2018 20:25:18 -0500
Message-ID: <5b8e8a71.1c69fb81.d966f.1ca1@mx.google.com>
References: <20180831035219.31619-1-ran.wang_1@nxp.com>
 <20180831035219.31619-2-ran.wang_1@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20180831035219.31619-2-ran.wang_1@nxp.com>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Ran Wang <ran.wang_1@nxp.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Leo Li <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 31, 2018 at 11:52:18AM +0800, Ran Wang wrote:
> Add property 'big-endian' and supportted IP's configuration info.
> Remove property 'fsl,#rcpm-wakeup-cell'.

"dt-bindings: soc: ..." for the subject

It is obvious reading the diff you are removing fsl,#rcpm-wakeup-cell. 
What is not obvious is why? The commit msg should answer that.

You also are mixing several things in this patch like adding ls1012 
which you don't mention. Please split.

> 
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/rcpm.txt |   42 ++++++-------------
>  1 files changed, 13 insertions(+), 29 deletions(-)
