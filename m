From: Jon Loeliger <jdl-CYoMK+44s/E@public.gmane.org>
Subject: Re: dtc: Handle linux,phandle properties which self-reference
Date: Mon, 17 Nov 2008 14:12:18 -0600
Message-ID: <E1L2ASI-0004Ew-31@jdl.com>
References: <20081107014944.GI6692@yookeroo.seuss>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-reply-to: <20081107014944.GI6692-787xzQ0H9iRg7VrjXcPTGA@public.gmane.org> 
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Scott Wood <scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, devicetree-discuss <devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Currently, dtc will generate phandles for nodes which are referenced
> elsewhere in the tree.  phandles can also be explicitly assigned by
> defining the linux,phandle property.  However, there is no way,
> currently to tell dtc to generate a phandle for a node if it is not
> referenced elsewhere.  This is inconvenient when it's expected that
> later processing on the flat tree might add nodes which _will_
> the node in question.
> 
> One way one might attempt to do this is with the construct:
> 	mynode: mynode {
> 		linux,phandle = <&mynode>;
> 		/* ... */
> 	};
> Though it's a trifle odd, there's really only one sensible meaning
> which can be assigned to this construct: allocate a unique phandle to
> "mynode" and put that in its linux,phandle property (as always).
> 
> Currently, however, dtc will choke on this self-reference.  This patch
> corrects this, making the construct above give the expected results.
> It also ensures a more meaningful error message is given if you
> attempt to process the nonsensical construct:
> 	mynode: mynode {
> 		linux,phandle = <&someothernode>;
> 		/* ... */
> 	};
> 
> The 'references' testcase is extended to cover this case, as well.
> 
> Signed-off-by: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

Applied.

Thanks,
jdl
