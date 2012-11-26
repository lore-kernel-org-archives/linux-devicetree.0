From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3.6.0] of: Add missing dummy functions
Date: Mon, 26 Nov 2012 10:38:43 +0000
Message-ID: <20121126103843.851603E08BB@localhost>
References: <1350469563-19345-1-git-send-email-srinivas.kandagatla@st.com>
 <507F23F7.5070509@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <507F23F7.5070509-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Srinivas KANDAGATLA <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 17 Oct 2012 16:32:39 -0500, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On 10/17/2012 05:26 AM, Srinivas KANDAGATLA wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla-qxv4g6HH51o@public.gmane.org>
> > 
> > Some functions in of.h have dummy functions and real implementations,
> > however few of them have only real implementation.
> > I think to be more consistent this patch adds below dummy functions if
> > for non CONFIG_OF's.
> > 
> 
> Fixing these up one by one has annoyed me, but I know Grant has
> generally resisted blindly creating empty functions. So I would like
> Grant's comments. I'm fine with these except the ones noted below.
> 
> > 	of_find_node_by_type
> 
> This should not be used except a few places as using device_type is
> generally only for true OF.
> 
> > 	of_device_is_available
> > 	of_find_node_with_property
> 
> Only used in 2 places.
> 
> > 	of_find_matching_node
> > 	of_find_node_by_path
> > 	of_find_node_by_phandle
> > 	of_get_parent
> > 	of_get_next_parent
> > 	of_get_next_child
> > 	of_get_next_available_child
> > 	of_get_child_by_name
> 
> Already have this one.
> 
> > 
> > Hopefully this can eliminate the need to ifdef code in the drivers.
> 
> Sometimes we want that for drivers that can be built both for OF and !OF
> and you can't optimize away all the code and data.

Right. I've been cautious here for a reason. As much as possible I want
to encourage of_* calls to be collected together in a driver, not
scattered all over the place. Often the whole block of OF-aware code in
a driver can be compiled out if it is grouped together into a function.

Also, some of these only make sense in the context of an OF-aware code
block and there is no sensible empty version.

So, I'm fine with adding the empty versions on a case-by-case basis, but
not wholesale.

g.
