From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: OF Clock binding discussion
Date: Thu, 17 Jun 2010 09:58:48 -0600
Message-ID: <AANLkTimDwCMTskN6us8RhZDM4aNFMLmeIMwZCRHUmuAj@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Jeremy Kerr <jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, David Gibson <david-xT8FGy+AXnR4Cd2VRjVQmg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Ben & David.

jk & I have been the clock binding details, some on the wiki's talk
page, but I'd like to get your opinions too.  Here's the URL, and the
discussion so far:

http://devicetree.org/Talk:ClockBindings


Text from talk page:

The use of indices in clock-map is a little messy and has been (in my
experience) an easy way to create an incorrect DT. It may be neater to
drop the clock-input-names property and define the clock-map property
as a list of:

 <input-name provider-phandle provider-output-name>

- ie, using the input name directly, and using the provider output
name rather than the index of the name in the provider's
clock-output-names property.

This means that there are fewer dependencies between properties; the
order of clock-map no longer depends on the (arbitrary) order of
clock-input-names, and doesn't need to index into the (arbitrarily
ordered) clock-output-names property.

This will add a bit of complexity to the parsing code, but this will
only need to be maintained in one place (ie, the generic of_clk
infrastructure).

--[[User:Jk|Jk]] 02:56, 16 June 2010 (UTC)

Yes, I agree.  The indicies in the clock-map is the part that I'm most
uncomfortable with.  Dropping the names altogether would almost be
better in this regard.  It would be harder to read, but at least there
would be only 1 levels of indirection <code>(input index --> output
index)</code> rather than 3 <code>(input name --> input index -->
output index --> output name)</code>.  And it would match closer with
already established patterns for interrupts and gpios.  However, the
redirection does have to happen somewhere, either in the device tree,
or in the driver code, as existing users (at least in Linux) refer to
clocks by name anyway.

I would also prefer the <input-name provider-phandle
provider-output-name> form, but that would require mixing string and
cell values in the same property.  The dtc compiler does support it in
this form, but it doesn't seem very tasteful to me:

 prop = "input-name", <&phandle>, "output-name";

Alternately, I've been thinking about adding code to path resolution
so that aliases are automatically dereferenced if the path is in the
form "<alias-name>:".  That combined with replacing the phandle with
the device alias or path would give this:

 prop = "<input-name>","<provider-path-or-alias>","<output-name>";

Which would ultimately look like one of these:

 prop = "bus-clk","&clk-source","clk1";  // full path using label
 prop = "bus-clk","clk-source:","clk1";  // using alias; much shorter
string when compiled

--[[User:GrantLikely|GrantLikely]] 15:45, 17 June 2010 (UTC)


-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
