From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Documentation: powerpc/fsl: Update compatible for
 l2cache binding
Date: Tue, 7 Feb 2017 12:52:17 -0600
Message-ID: <20170207185217.b3vtbzomipn2lowm@rob-hp-laptop>
References: <20170203004316.25291-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
Content-Disposition: inline
In-Reply-To: <20170203004316.25291-1-chris.packham@alliedtelesis.co.nz>
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
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 01:43:16PM +1300, Chris Packham wrote:
> List all the current valid compatible strings for the l2cache binding.
> This should stop checkpatch.pl from complaining and will hopefully save
> someone from having to debug a typo in their dts.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>  .../devicetree/bindings/powerpc/fsl/l2cache.txt    | 42 ++++++++++++++++++++--
>  1 file changed, 40 insertions(+), 2 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
