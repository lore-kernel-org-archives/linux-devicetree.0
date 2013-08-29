From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [PATCH] of: Feed entire flattened device tree into the random pool
Date: Thu, 29 Aug 2013 21:47:48 +0100
Message-ID: <20130829204748.E8F6D3E1222@localhost>
References: <20130725125122.78accf44@kryten>
 <20130725031717.GB15673@concordia> <20130725143031.16af0a96@kryten>
 <20130728044942.A58793E0A24@localhost> <20130729131150.591926c3@kryten>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20130729131150.591926c3@kryten>
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
To: Anton Blanchard <anton@samba.org>
Cc: devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
List-Id: devicetree@vger.kernel.org

On Mon, 29 Jul 2013 13:11:50 +1000, Anton Blanchard <anton@samba.org> wrote:
> 
> Hi,
> 
> > be32_to_cpu(initial_boot_params->totalsize);
> 
> Ouch, thanks Grant.
> 
> Anton
> --
> 
> We feed the entire DMI table into the random pool to provide
> better random data during early boot, so do the same with the
> flattened device tree.
> 
> Signed-off-by: Anton Blanchard <anton@samba.org>

Applied, thanks

g.
