From: Segher Boessenkool <segher-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH] of: support an enumerated-bus compatible value
Date: Mon, 2 Jul 2012 23:44:47 +0200
Message-ID: <6BC22F77-77D7-45DF-821A-6CA2DBADEA59@kernel.crashing.org>
References: <1340924755-31447-1-git-send-email-swarren@wwwdotorg.org>
 <4FF0A6B6.8040902@gmail.com> <4FF1C567.4060809@wwwdotorg.org>
 <4FF1D8F9.9040005@firmworks.com> <4FF1DDBD.9050106@wwwdotorg.org>
 <4FF1EA1A.9030307@firmworks.com> <4FF1F955.6030204@wwwdotorg.org>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4FF1F955.6030204-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

> But don't get too hung up on regulators; there are plenty of other
> devices that can exist in DT that aren't memory-mapped; GPIO-keys,
> aggregate sound complexes, perhaps WiFi/rfkill nodes, etc. All are
> affected by the same DT representation issue.

So what is the issue?  You have some node (the "bus node") under which
you have the "regulator@0", "frobnicator@1" etc. nodes.  You refer to
these device nodes by phandle always, you cannot programmatically
control those devices (otherwise, they should be child node of a *real*
bus node).  The bus node does not represent any device at all, and no
device driver can ever do anything with it; it should not have a
"compatible" property either.


Segher
