From: Scott Wood <oss@buserror.net>
Subject: Re: [PATCH 1/3 v2] powerpc/fsl: Use new clockgen binding
Date: Wed, 24 Oct 2018 12:41:16 -0500
Message-ID: <7bceb12756766931772f2ec37f94ad8cdfeb0fd5.camel@buserror.net>
References: <20181024021122.3942-1-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20181024021122.3942-1-andy.tang@nxp.com>
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
To: andy.tang@nxp.com, sboyd@kernel.org, mturquette@baylibre.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, 2018-10-24 at 10:11 +0800, andy.tang@nxp.com wrote:
> From: Scott Wood <oss@buserror.net>
> 
> The driver retains compatibility with old device trees, but we don't
> want the old nodes lying around to be copied, or used as a reference
> (some of the mux options are incorrect), or even just being clutter.
> 
> We will also need the #clock-cells in the clockgen node in order to
> add fman nodes.

The comment about #clock-cells is no longer relevant to this patch, since that
 has already been added.

-Scott
