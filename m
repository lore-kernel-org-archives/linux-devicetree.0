From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: Proposal: new device-tree syntax and semantics for extending
	information from included dts files
Date: Wed, 13 Oct 2010 19:49:58 -0600
Message-ID: <20101014014958.GG15286@angua.secretlab.ca>
References: <1286920561.4535.1315.camel@riker>
	<20101013231747.GD15286@angua.secretlab.ca>
	<20101014003833.GB4456@yookeroo>
	<20101014014036.GE15286@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101014014036.GE15286-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, John Bonesio <bones-RkXMcIGFT/TR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 13, 2010 at 07:40:36PM -0600, Grant Likely wrote:
> On Thu, Oct 14, 2010 at 11:38:33AM +1100, David Gibson wrote:
> > On Wed, Oct 13, 2010 at 05:17:47PM -0600, Grant Likely wrote:
> > > On Tue, Oct 12, 2010 at 02:56:01PM -0700, John Bonesio wrote:
> &some-node {
> 	property-to-remove /remove-prop/;
> 	property-to-replace = "new value";
> 	property-to-replace-with-empty-prop;
> 
> 	node-to-remove /remove-node/;
> 	node-to-replace /remove-node/ { prop = "blah"; };
> };
> 
> Or perhaps with the keyword preceding:
> 
> &some-node {
> 	/remove-prop/ property-to-remove;
> 	property-to-replace = "new value";
> 	property-to-replace-with-empty-prop;
> 
> 	/remove-node/ node-to-remove;
> 	/remove-node/ node-to-replace { prop = "blah"; };
> };

I should probably also mock-up what it would look like when the target
node is at the top level.  With keyword after the node name:

/ {
	...
};
&some-node-to-remove /remove-node/;
&some-node-to-replace /remove-node/ { prop = "blah"; };

And with keywords preceeding:

/ {
	...
};
/remove-node/ &some-node-to-remove;
/remove-node/ &some-node-to-replace { prop = "blah"; };

g.
