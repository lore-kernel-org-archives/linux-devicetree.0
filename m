From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] dtc: check for duplicate labels when they are defined
Date: Mon, 14 May 2012 12:40:22 -0600
Message-ID: <4FB15196.3090200@wwwdotorg.org>
References: <1332905984-2130-1-git-send-email-swarren@wwwdotorg.org>
 <20120403024634.GG7481@truffala.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120403024634.GG7481-MK4v0fQdeXQXU02nzanrWNbf9cGiqdzd@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/02/2012 08:46 PM, David Gibson wrote:
> On Tue, Mar 27, 2012 at 09:39:44PM -0600, Stephen Warren wrote:
>> Currently, the DT is checked for duplicate labels after the entire DT has
>> been parsed. However, once parts of the DT can be deleted, some entities
>> with labels may have been deleted by this time, thus making those labels
>> invisible to the duplicate label check, which can then lead to false
>> negatives.
>>
>> Instead, maintain a list of all known labels, from which entries are
>> never deleted, and check against this list for duplicates when adding
>> labels.
>>
>> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>> ---
>> This patch should be applied before my previously posted "dtc: Add
>> ability to delete nodes and properties". I believe it addresses David's
>> concerns with that patch re: the assumption that labels are
>> immutable.
> 
> Hm, I suppose it does.  Or at least it removes the more complex
> objections.  I'd still want to relook at the deletion patch to
> convince myself that the syntax is as good as we can reasonably make
> it.
> 
> This patch is a bit of a hack, and I'm not thrilled at the loss of
> information from the error message, but I can live wth it.
> 
> The other approach I was thinking of, which is hacky in different
> ways, would be to change the deletion patch so that instead of
> actually removing the deleted nodes from the tree, just marks them as
> deleted.  They'd then be omitted from the output pass, but the labels
> attached therein can still be found.

So is this patch good to be applied, or would you rather it was reworked
according the other approach you mentioned?
