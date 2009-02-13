From: Markus Armbruster <armbru-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Qemu-devel] [RFC] Machine description as data
Date: Fri, 13 Feb 2009 12:19:21 +0100
Message-ID: <87iqner3d2.fsf@pike.pond.sub.org>
References: <20090212040138.GD31142@yookeroo.seuss>
	<20090212.094613.514366467.imp@bsdimp.com>
	<87prhnwltz.fsf@pike.pond.sub.org> <4994B7B6.80805@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
In-Reply-To: <4994B7B6.80805-hi6Y0CQ0nG0@public.gmane.org> (Carl-Daniel Hailfinger's message of
	"Fri\, 13 Feb 2009 00\:58\:46 +0100")
List-Unsubscribe: <https://ozlabs.org/mailman/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=unsubscribe>
List-Archive: <http://ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=help>
List-Subscribe: <https://ozlabs.org/mailman/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-mnsaURCQ41sdnm+yROfE0A@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-mnsaURCQ41sdnm+yROfE0A@public.gmane.org
To: qemu-devel-qX2TKyscuCcdnm+yROfE0A@public.gmane.org
Cc: devicetree-discuss-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, hollisb-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006-hi6Y0CQ0nG0@public.gmane.org> writes:

> How exactly do you represent a digraph with some cycles as a decorated
> tree? The solution should allow people without an extensive background
> in IEEE1275 to change the graph as needed.

Okay, calling it just a decorated tree is not 100% accurate.  It's a
decorated tree where a certain kind of decoration can refer to another
node.  These additional edges actually make it a directed graph.  But we
still have a tree embedded in that graph, which is useful when we
convert it to or from text.

[...]
